@extends('layouts.app')

@section('title')
    {{ __('Login') }}
@endsection

@section('content')
    <div class="container bg-black text-gray-200 p-0 rounded shadow-xl">

        <div class="shadow-2xl border-bottom p-3 mb-3 text-center">
            <p class="h3">{{ __('Login') }}</p>
            <p class="text-green-500 my-3">{{ __('Complete with your data') }}</p>
        </div>

        <form method="POST" action="{{ route('login') }}" class="p-3">
            @csrf

            {{-- Email --}}
            <div class="form-group my-4">
                <label for="email">{{ __('Email') }}</label>
                <input type="email" name="email" id="email" class="input" required />
            </div>

            @error('email')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror

            {{-- Password --}}
            <div class="form-group my-4">
                <label for="password">{{ __('Password') }}</label>
                <input type="password" name="password" id="password" class="input @error('password') is-invalid @enderror" required autocomplete="current-password" />

                @error('password')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
            @error('password')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
            @enderror

            {{-- Extras --}} 
            <div class="form-group my-4">
                <div class="form-check">
                    <input type="checkbox" name="remember" id="remember" class="form-check-input" {{ old('remember') ? 'checked' : '' }} />

                    <label class="form-check-label" for="remember">
                        {{ __('Remember Me') }}
                    </label>
                </div>
            </div>


            <div class="form-group my-4">
                <button class="btn btn-outline-success btn-block my-3">{{ __('Login') }}</button>

                @if (Route::has('password.request'))
                    <a class="text-blue-500" href="{{ route('password.request') }}">
                        {{ __('Forgot Your Password?') }}
                    </a>
                @endif
                <br>
                <a class="text-blue-500" href="{{ route('register') }}">
                    {{ __('Or register here?') }}
                </a>
            </div>
        </form>
    </div>
@endsection