<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    /**
     * Usage: ->middleware('role:admin') or 'role:admin,user'
     */
    // public function handle(Request $request, Closure $next, ...$roles): Response
    // {
    //     // $user = $request->user();

    //     // if (!$user) {
    //     //     return redirect()->route('login');
    //     // }

    //     // if ($roles && !in_array($user->role, $roles, true)) {
    //     //     abort(403); // or redirect('/'); or redirect()->route('dashboard')
    //     // }

    //     // return $next($request);
    //     if($request->user()->role === $roles){
    //         return $next($request);
    //     }

    //     return to_route('dashboard');

    // }
    public function handle(Request $request, Closure $next, ...$roles): Response
    {
        $user = $request->user();

        if (!$user) {
            return redirect()->route('login'); // or abort(401)
        }

        if (!empty($roles) && !in_array($user->role, $roles, true)) {
            abort(403); // block non-admins instead of redirecting them
            // (if you prefer redirect, change this line, but 403 is clearer)
        }

        return $next($request);
    }
}
