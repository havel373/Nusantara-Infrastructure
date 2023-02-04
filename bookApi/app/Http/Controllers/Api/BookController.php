<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BookResource;
use App\Models\Book;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BookController extends Controller
{
    public function __construct()
    { 
        $this->middleware('auth:api');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // dd($request);
        return BookResource::collection(
            Book::where('title','like','%'.$request->keywords.'%')->paginate(5)
        );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'isbn' => 'required|max:100',
            'title' => 'required',
            'description' => 'required',
            'subtitle' => 'required',
            'author' => 'required',
            'published' => 'required',
            'publisher' => 'required',
            'pages' => 'required',
            'website' => 'required',
        ]);
        if($validator->fails()) {
            return response()->json($validator->messages(),422);
        }
    
        $book = new Book;
        $book->isbn = $request->isbn;
        $book->title = $request->title;
        $book->subtitle = $request->subtitle;
        $book->description = $request->description;
        $book->author = $request->author;
        $book->published = $request->published;
        $book->publisher = $request->publisher;
        $book->pages = $request->pages;
        $book->website = $request->website;
        $book->created_at = now();
        $book->updated_at = now();
        $book->save();
        return response()->json(['message'=>'Berhasil Ditambahkan!'],201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Book  $book
     * @return \Illuminate\Http\Response
     */
    public function show($book_id)
    {
        $book = Book::where('id', $book_id)->first();
        if($book == null){
            return response()->json(['message'=>'No Data!'],200);
        }else{
            return new BookResource(
                Book::where('id', $book_id)->first()
            );
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Book  $book
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $book_id)
    {
        $book = Book::where('id', $book_id)->first();
        if($book == null){
            return response()->json(['message'=>'No Data!'],200);
        }else{
            $validator = Validator::make($request->all(), [
                'isbn' => 'required|max:100',
                'title' => 'required',
                'subtitle' => 'required',
                'author' => 'required',
                'published' => 'required',
                'publisher' => 'required',
                'pages' => 'required',
                'website' => 'required',
            ]);
            if($validator->fails()) {
                return response()->json($validator->messages(),422);
            }
        
            $book->isbn = $request->isbn;
            $book->title = $request->title;
            $book->subtitle = $request->subtitle;
            $book->author = $request->author;
            $book->published = $request->published;
            $book->publisher = $request->publisher;
            $book->pages = $request->pages;
            $book->website = $request->website;
            $book->created_at = now();
            $book->updated_at = now();
            $book->update();
            return response()->json(['message'=>'Berhasil Diubah!'],200);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Book  $book
     * @return \Illuminate\Http\Response
     */
    public function destroy($book_id)
    {
        $book = Book::where('id', $book_id)->first();
        if($book == null){
            return response()->json(['message'=>'No Data!'],200);
        }else{
            $book->delete();
            return response()->json(['message'=>'Berhasil Dihapus!'],200);
        }
    }

    public function search($key){
        return BookResource::collection(
            Book::paginate(5)
        );
    }
}
