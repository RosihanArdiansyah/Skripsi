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

    public function types()
    {
        return $this->hasMany(Types::class);
    }

    public function reports()
    {
        return $this->hasMany(Reports::class);
    }

}
