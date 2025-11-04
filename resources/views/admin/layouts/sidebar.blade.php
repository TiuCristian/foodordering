   <nav class="navbar navbar-expand-lg main-navbar">
        <form class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
            <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
          </ul>
        </form>
        <ul class="navbar-nav navbar-right">
    <li class="dropdown"><a href="#" data-toggle="dropdown"
                class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                <img alt="image" src="{{ asset(auth()->user()->avatar) }}" class="rounded-circle mr-1">
                <div class="d-sm-none d-lg-inline-block">Hi, {{ auth()->user()->name }}</div>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a href="{{ url('/admin/profile') }}" class="dropdown-item has-icon">
                    <i class="far fa-user"></i> Profile
                </a>
                <a href="" class="dropdown-item has-icon">
                    <i class="fas fa-cog"></i> Settings
                </a>
              <div class="dropdown-divider"></div>
                  <!-- Authentication -->
                <form method="POST" action="{{ route('logout') }}">
                    @csrf

                    <a href="{{ route('logout') }}"
                        onclick="event.preventDefault();
                    this.closest('form').submit();"
                        class="dropdown-item has-icon text-danger">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </form>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">

          <div class="sidebar-brand">
            <a href="index.html">Stisla</a>
          </div>
          <div class="sidebar-brand sidebar-brand-sm">
            <a href="index.html">St</a>
          </div>
          <ul class="sidebar-menu">
            <li class="menu-header">Dashboard</li>
                <li class=active><a class="nav-link" href="/admin/dashboard">General Dashboard</a></li>
            <li class="menu-header">Starter</li>
            <li>
              <a class="nav-link" href="{{ route('slider.index') }}">
                <span>Slider</span>
              </a>
            </li>
              <li>
              <a class="nav-link" href="{{ route('why-choose-us.index') }}">
                <span>Why Choose Us</span>
              </a>
            </li>
            <li class="dropdown">
              <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-columns"></i> <span>Manage Restaurant</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="{{ route('category.index') }}">Product Category</a></li>
                <li><a class="nav-link" href="{{ route('product.index') }}">Products</a></li>
              </ul>
            </li>
            <li><a class="nav-link" href="{{ route('settings.index') }}"><i class="far fa-square"></i> <span>Settings</span></a></li>
            {{-- <li class="dropdown">
              <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-columns"></i> <span>Layout</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="layout-default.html">Default Layout</a></li>
                <li><a class="nav-link" href="layout-transparent.html">Transparent Sidebar</a></li>
                <li><a class="nav-link" href="layout-top-navigation.html">Top Navigation</a></li>
              </ul>
            </li> --}}
            {{-- <li><a class="nav-link" href="blank.html"><i class="far fa-square"></i> <span>Blank Page</span></a></li> --}}

            <li class="dropdown {{ setSidebarActive([
                'admin.category.*',
                'admin.product.*',
                'admin.product-reviews.index',
            ]) }}">
                <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-shopping-cart"></i>
                    <span>Manage Products </span></a>
                <ul class="dropdown-menu">
                    <li class="{{ setSidebarActive(['admin.category.*']) }}" ><a class="nav-link" href="{{ route('category.index') }}">Product Categories</a></li>
                    <li class="{{ setSidebarActive(['admin.product.*']) }}" ><a class="nav-link" href="{{ route('product.index') }}">Products</a></li>
                    <li class="{{ setSidebarActive(['admin.product-reviews.index']) }}" ><a class="nav-link" href="{{ route('product-reviews.index') }}">Product Reviews</a>
                    </li>
                </ul>
            </li>
          </ul>

        </aside>
      </div>