<?php

namespace App\Service;

use App\Models\Settings;
use Cache;

class SettingsService
{

    function getSettings()
    {
        return Cache::rememberForever('settings', function () {
            return Settings::pluck('value', 'key')->toArray(); // ['key' => 'value']
        });
    }

    function setGlobalSettings(): void
    {
        $settings = $this->getSettings();
        config()->set('settings', $settings);
    }

    function clearCachedSettings(): void
    {
        Cache::forget('settings');
    }
}
