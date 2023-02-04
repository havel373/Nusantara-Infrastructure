<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BookController;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, Authorization");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);
Route::prefix('user')->group(function(){
    Route::get('', [AuthController::class, 'user']);
    Route::delete('logout', [AuthController::class, 'logout']);
});

Route::prefix('books/')->group(function(){
    Route::get('', [BookController::class,'index']);
    Route::get('{book_id}',[BookController::class,'show']);
    Route::post('add',[BookController::class,'store']);
    Route::put('{book_id}/edit',[BookController::class,'update']);
    Route::delete('{book_id}',[BookController::class,'destroy']);
});