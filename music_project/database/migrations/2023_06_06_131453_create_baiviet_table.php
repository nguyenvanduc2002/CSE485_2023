<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('baiviet', function (Blueprint $table) {
         //   $table->id();
           // $table->timestamps();
           $table->increments('ma_bviet');
           $table->string('tieude',200);
           $table->string('ten_bhat',100);
           $table->unsignedInteger('ma_tloai');
           $table->text('tomtat');
           $table->text('noidung')->nullable();
           // số nguyên không dấu
           $table->unsignedInteger('ma_tgia');
           // đặt gian là h hiện tại
           $table->dateTime('ngayviet')->default(DB::raw('CURRENT_TIMESTAMP'));
           $table->string('hinhanh',200)->nullable();
           // khóa phụ
           $table->foreign('ma_tloai')->references('ma_tloai')->on('theloai')->onDelete('cascade');
           $table->foreign('ma_tgia')->references('ma_tgia')->on('tacgia')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('baiviet');
    }
};
