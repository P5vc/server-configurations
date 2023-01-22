/*
 * You can override the configurable values from this file.
 * The recommended method is to make a copy of this file (/customize.dist/application_config.js)
   in a 'customize' directory (/customize/application_config.js).
 * If you want to check all the configurable values, you can open the internal configuration file
   but you should not change it directly (/common/application_config_internal.js)
*/
define(['/common/application_config_internal.js'], function (AppConfig) {
    /* New applications may be introduced in an "early access" state which can contain
     * bugs and can cause loss of user content. You can enable these applications on your
     * CryptPad instance to test them and report bugs to the developers or keep them
     * disabled until they are officially considered safe.
     */
    AppConfig.enableEarlyAccess = true;

    /*  user passwords are hashed with scrypt, and salted with their username.
        this value will be appended to the username, causing the resulting hash
        to differ from other CryptPad instances if customized. This makes it
        such that anyone who wants to bruteforce common credentials must do so
        again on each CryptPad instance that they wish to attack.
        WARNING: this should only be set when your CryptPad instance is first
        created. Changing it at a later time will break logins for all existing
        users.
    */
    AppConfig.loginSalt = '{{ cryptpad_salt }}';
    AppConfig.minimumPasswordLength = 12;

    return AppConfig;
});
