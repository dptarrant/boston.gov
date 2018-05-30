<?php
/**
 * @file
 * labtest.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function labtest_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_node_info().
 */
function labtest_node_info() {
  $items = array(
    'labtest_test' => array(
      'name' => t('Labtest Test'),
      'base' => 'node_content',
      'description' => t('CT to test creation in labtest.'),
      'has_title' => '1',
      'title_label' => t('Title'),
      'help' => '',
    ),
  );
  drupal_alter('node_info', $items);
  return $items;
}
