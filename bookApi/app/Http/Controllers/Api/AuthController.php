<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Traits\AuthUserTrait;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    use AuthUserTrait;
    public function __construct()
    {
        $this->middleware('auth:api',['except'=>['login','register']]);
        return auth()->shouldUse('api');
    }
    public function login(){
        $credentials = User::where(['email' => request()->email])->first();
        if($credentials){
            $account = request(['email','password']);
            if(! $token = auth()->attempt($account)){
                return response()->json(['error'=>'Unauthorized'],401);
            }
            return response()->json([
                $this->responseWithToken($token)
            ], 200);
        }else{
            return response()->json(['error'=>'Account not found'],401);
        }
    }

    public function register(Request $request){
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required',
        ]);

        if($validator->fails()) {
            return response()->json($validator->messages(),422);
        }

        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make(request('password'));
        $user->save();
        return response()->json(['message'=>'Successfully Register!'],201);
    }

    public function responseWithToken($token)
    {
        return response()->json([
        'access_token'=> $token,
        'token_type'=> 'bearer',
        'expires'=> auth()->factory()->getTTL() * 60,
        ]);
    }

    public function user()
    {
        $token = auth()->user();
        return response()->json([
        'name'=> auth()->user()->name,
        'email'=> auth()->user()->email,
        'token' =>  $this->responseWithToken($token),
        ]);
    }

    public function logout(){
        return $this->responseWithToken(auth()->refresh(true,true));
    }
}
