using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace MVCBlogs.Models
{
    public class Blog
    {
        public int BlogId { get; set; }
        [Required]
        public string Url { get; set; }

        public List<Post> Posts { get; set; }
    }
}