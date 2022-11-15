<!-- The Modal -->
<div class="modal fade" id="add_categories">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Add Category</h4>
        <button type="button" class="btn-close"  data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form method="POST" action="add">
            <input type="hidden" value="category" name="operationType">
            <label>Category Title</label><br>
            <input type = "text" name = 'category_title' id = 'category_title' class="input-fields" placeholder="Add Category Title" required><br>
            <label>Category Description</label><br>
            <textarea class="form-control" name = 'category_desc' id = 'description_field' class="input-fields"  placeholder="Add Category Description" required></textarea><br>
            <div class="d-flex justify-content-center">
                <input type="submit" value='Add Category' id="signup-btn">
            </div>
        </form>
      </div>
    </div>
 </div>
 </div>