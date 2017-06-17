extern struct bluetooth_plugin_desc __bluetooth_builtin_audio;
extern struct bluetooth_plugin_desc __bluetooth_builtin_input;
extern struct bluetooth_plugin_desc __bluetooth_builtin_serial;
extern struct bluetooth_plugin_desc __bluetooth_builtin_network;
extern struct bluetooth_plugin_desc __bluetooth_builtin_service;
extern struct bluetooth_plugin_desc __bluetooth_builtin_thermometer;
extern struct bluetooth_plugin_desc __bluetooth_builtin_alert;
extern struct bluetooth_plugin_desc __bluetooth_builtin_time;
extern struct bluetooth_plugin_desc __bluetooth_builtin_gatt_example;
extern struct bluetooth_plugin_desc __bluetooth_builtin_proximity;
extern struct bluetooth_plugin_desc __bluetooth_builtin_deviceinfo;
extern struct bluetooth_plugin_desc __bluetooth_builtin_hciops;
extern struct bluetooth_plugin_desc __bluetooth_builtin_mgmtops;
extern struct bluetooth_plugin_desc __bluetooth_builtin_formfactor;
extern struct bluetooth_plugin_desc __bluetooth_builtin_storage;
extern struct bluetooth_plugin_desc __bluetooth_builtin_adaptername;
extern struct bluetooth_plugin_desc __bluetooth_builtin_wiimote;

static struct bluetooth_plugin_desc *__bluetooth_builtin[] = {
  &__bluetooth_builtin_audio,
  &__bluetooth_builtin_input,
  &__bluetooth_builtin_serial,
  &__bluetooth_builtin_network,
  &__bluetooth_builtin_service,
  &__bluetooth_builtin_thermometer,
  &__bluetooth_builtin_alert,
  &__bluetooth_builtin_time,
  &__bluetooth_builtin_gatt_example,
  &__bluetooth_builtin_proximity,
  &__bluetooth_builtin_deviceinfo,
  &__bluetooth_builtin_hciops,
  &__bluetooth_builtin_mgmtops,
  &__bluetooth_builtin_formfactor,
  &__bluetooth_builtin_storage,
  &__bluetooth_builtin_adaptername,
  &__bluetooth_builtin_wiimote,
  NULL
};
