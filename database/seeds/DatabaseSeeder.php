<?php

use App\Models\Account;
use App\Models\Organization;
use App\Models\User;
use App\Models\Docs;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $account = Account::create(['name' => 'Universitas Hasanuddin']);

        factory(User::class)->create([
            'account_id' => $account->id,
            'first_name' => 'John',
            'last_name' => 'Doe',
            'email' => 'johndoe@example.com',
            'owner' => true,
        ]);

        factory(User::class, 5)->create(['account_id' => $account->id]);

        
    }
}
