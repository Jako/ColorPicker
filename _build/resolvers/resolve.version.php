<?php
/**
 * Resolve version changes
 *
 * @package agenda
 * @subpackage build
 *
 * @var array $options
 * @var xPDOObject $object
 */

$success = false;

if ($object->xpdo) {
    if (!function_exists('resolveHexFormat')) {
        function resolveHexFormat($modx)
        {
            $countTvValues = 0;

            $c = $modx->newQuery('modTemplateVarResource');
            $c->leftJoin('modTemplateVar', 'TemplateVar', [
                'modTemplateVarResource.tmplvarid = TemplateVar.id'
            ]);
            $c->where(['TemplateVar.type' => 'colorpicker']);
            /** @var modTemplateVar[] $events */
            $templateVarValues = $modx->getIterator('modTemplateVarResource', $c);
            foreach ($templateVarValues as $templateVarValue) {
                $value = $templateVarValue->get('value');
                if ($value !== '' && strpos($value, '#') === false) {
                    $templateVarValue->set('value', '#' . $value);
                    $templateVarValue->save();
                    $countTvValues++;
                }
            }

            if ($countTvValues) {
                $modx->log(xPDO::LOG_LEVEL_INFO, $countTvValues . ' template variable values have been prefixed with a "#" character.');
            }

            $countDefaultValues = 0;

            $c = $modx->newQuery('modTemplateVar');
            $c->where(['type' => 'colorpicker']);
            /** @var modTemplateVar[] $events */
            $templateVars = $modx->getIterator('modTemplateVar', $c);
            foreach ($templateVars as $templateVar) {
                $defaultValue = $templateVar->get('default_text');
                if ($defaultValue !== '' && strpos($defaultValue, '#') === false) {
                    $templateVar->set('default_text', '#' . $defaultValue);
                    $templateVar->save();
                    $countDefaultValues++;
                }
            }

            if ($countDefaultValues) {
                $modx->log(xPDO::LOG_LEVEL_INFO, $countDefaultValues . ' default values have been prefixed with a "#" character.');
            }
        }
    }

    /** @var xPDO $modx */
    $modx =& $object->xpdo;

    switch ($options[xPDOTransport::PACKAGE_ACTION]) {
        case xPDOTransport::ACTION_INSTALL:
        case xPDOTransport::ACTION_UPGRADE:
            $c = $modx->newQuery('transport.modTransportPackage');
            $c->where(
                [
                    'workspace' => 1,
                    "(SELECT
            `signature`
            FROM {$modx->getTableName('transport.modTransportPackage')} AS `latestPackage`
            WHERE `latestPackage`.`package_name` = `modTransportPackage`.`package_name`
            ORDER BY
                `latestPackage`.`version_major` DESC,
                `latestPackage`.`version_minor` DESC,
                `latestPackage`.`version_patch` DESC,
                IF(`release` = '' OR `release` = 'ga' OR `release` = 'pl','z',`release`) DESC,
                `latestPackage`.`release_index` DESC
                LIMIT 1,1) = `modTransportPackage`.`signature`",
                ]
            );
            $c->where(
                [
                    'modTransportPackage.signature:LIKE' => $options['namespace'] . '-%',
                    'modTransportPackage.installed:IS NOT' => null
                ]
            );
            $c->limit(1);

            /** @var modTransportPackage $oldPackage */
            $oldPackage = $modx->getObject('transport.modTransportPackage', $c);

            if ($oldPackage && $oldPackage->compareVersion('2.0.0', '>')) {
                resolveHexFormat($modx);
            }
            $success = true;
            break;
        case xPDOTransport::ACTION_UNINSTALL:
            $success = true;
            break;
    }
}
return $success;
