<?php

namespace App\Http\Controllers\Api\V1\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:users',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6'
        ]);

        if ($validator->fails()) {
            return response()->json([], 403);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'email_verified_at' => now(),
        ]);

        $user->save();

        return response()->json([
            'message' => 'User successfully registered',
            'user' => $user
        ], 200);
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|exists:users',
            'password' => 'required|min:6'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ], 403);
        }

        $data = [
            'email' => $request->email,
            'password' => $request->password
        ];


        if (auth()->attempt($data)) {

            $user = auth()->user();

            return response()->json(['User' => $user], 200);
        } else {
            $errors = [];
            array_push($errors, ['code' => 'auth-001', 'message' => "Invalid credentials"]);
            return response()->json([
                'errors' => $errors
            ], 401);
        }
    }
}