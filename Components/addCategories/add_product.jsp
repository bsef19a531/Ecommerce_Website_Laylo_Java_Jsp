<!-- The Modal -->
<div class="modal fade" id="add_products">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Add Product</h4>
          <button type="button" class="btn-close"  data-bs-dismiss="modal"></button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
          <form method="POST" action="add" enctype="multipart/form-data">
              <input type="hidden" value="product" name="operationType">
              <label>Product Name</label><br>
              <input type = "text" name = 'product_name' id = 'product_name' class="input-fields" placeholder="Add Product Name" required><br>
              <label>Product Description</label><br>
              <textarea class="form-control" name = 'product_desc' id = 'description_field' class="input-fields"  placeholder="Add Product Description" required></textarea><br>
              <label>Product Price</label><br>
              <input type = "number" name = 'product_price' id = 'product_price' class="input-fields" placeholder="Add Product Price" required><br>
              <label>Product Discount</label><br>
              <input type = "number" name = 'product_discount' id = 'product_discount' class="input-fields" placeholder="Add Product Discount" required><br>
              <label>Product Quantity</label><br>
              <input type = "number" name = 'product_quantity' id = 'product_quantity' class="input-fields" placeholder="Add Product Quantity" required><br>
              
              <%
                  String dbAddress = getServletContext().getInitParameter("DataBaseAddress");
                  String dbDriver = getServletContext().getInitParameter("DataBaseDriver");
              %>
              
              <label>Select Product Category</label><br>
              <select id="category_selector" class="form-control" name="product-category">
                <%
                for (String cat : productCategory) {
                %>
                <option id="category_option" value="<%=cat%>"><%=cat%></option>
                <%}%>

              </select>




              <label>Add Product Image</label><br>
              <input type = "file" name = 'product_image' id = 'product_image' accept="image/png, image/gif, image/jpeg" required><br>

              <div class="d-flex justify-content-center">
                  <input type="submit" value='Add Product' id="signup-btn">
              </div>
          </form>
        </div>
      </div>
   </div>
   </div>