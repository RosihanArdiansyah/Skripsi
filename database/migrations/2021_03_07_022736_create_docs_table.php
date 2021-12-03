<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDocsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('docs', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('account_id')->index();
            $table->integer('types_id')->index();
            $table->string('docs_name', 100);
            $table->string('author', 100);            
            $table->string('publisher', 191);
            $table->string('NIM', 100);
            $table->string('department', 100);
            $table->integer('year');
            $table->integer('stok_buku')->default(1);
            $table->boolean('status')->default(true);
            $table->string('book_code', 100)->nullable();
            $table->string('files', 100)->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('docs');
    }
}
