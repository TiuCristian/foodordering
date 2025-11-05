<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Contracts\View\View;
use App\Models\Slider;
use App\Models\WhyChooseUs;
use App\Models\SectionTitle;
use App\Models\Category;
use App\Models\Product;
use App\Models\DailyOffer;

use Illuminate\Support\Collection;



class FrontendController extends Controller
{
    //
    function index() : View {
        $sectionTitles = $this->getSectionTitles();
        $sliders = Slider::where('status', 1)->get();
        $whyChooseUs = WhyChooseUs::where('status', 1)->get();
        $categories = Category::where(['show_at_home' => 1, 'status' => 1])->get();
        $dailyOffers = DailyOffer::with('product')->where('status', 1)->take(15)->get();
        return view('frontend.home.index', compact(
                    'sliders', 
                    'whyChooseUs', 
                    'sectionTitles', 
                    'categories',
                    'dailyOffers',
                ));
    }

    function getSectionTitles(): Collection
    {
        $keys = [
            'why_choose_top_title',
            'why_choose_main_title',
            'why_choose_sub_title',
            'daily_offer_top_title',
            'daily_offer_main_title',
            'daily_offer_sub_title',
            'chef_top_title',
            'chef_main_title',
            'chef_sub_title',
            'testimonial_top_title',
            'testimonial_main_title',
            'testimonial_sub_title'
        ];

        return SectionTitle::whereIn('key', $keys)->pluck('value', 'key');
    }

    function showProduct(string $slug): View
    {
        $product = Product::with(['productImages', 'productSizes', 'productOptions'])->where(['slug' => $slug, 'status' => 1])
            // ->withAvg('reviews', 'rating')
            // ->withCount('reviews')
            ->firstOrFail();

        $relatedProducts = Product::where('category_id', $product->category_id)
            ->where('id', '!=', $product->id)->take(8)
            // ->withAvg('reviews', 'rating')
            // ->withCount('reviews')
            ->latest()->get();
        //  $reviews = ProductRating::where(['product_id' => $product->id, 'status' => 1])->paginate(30);
        //  return view('frontend.pages.product-view', compact('product', 'relatedProducts', 'reviews'));
         return view('frontend.pages.product-view', compact('product', 'relatedProducts'));
    }

    function loadProductModal($productId)
    {
        $product = Product::with(['productSizes', 'productOptions'])->findOrFail($productId);
        return view('frontend.layouts.ajax-files.product-popup-modal', compact('product'))->render();
    }
  
}
