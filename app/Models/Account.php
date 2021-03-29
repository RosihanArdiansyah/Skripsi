<?php

namespace App\Models;

class Account extends Model
{
    public function users()
    {
        return $this->hasMany(User::class);
    }

    public function docs()
    {
        return $this->hasMany(Docs::class);
    }

}
