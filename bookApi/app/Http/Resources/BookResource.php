<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BookResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'isbn' => $this->isbn,
            'title' => $this->title,
            'subtitle' => $this->subtitle,
            'author' => $this->author,
            'published' => $this->published,
            'description' => $this->description,
            'publisher' => $this->publisher,
            'pages' => $this->pages,
            'website' => $this->website,
        ];
    }
}
