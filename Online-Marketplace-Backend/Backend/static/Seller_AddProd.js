// Seller page Add Product form Functionality

// Toggle add form visibilty
function toggleForm() {
    const form = document.getElementById("productForm");
    const isHidden = window.getComputedStyle(form).display === "none";

    form.style.display = isHidden ? "flex" : "none";
}

// Functionality for edit and button
function editDemo() {
    alert('Edit product');
}

function deleteDemo() {
    if (confirm('Delete product?')) {
        alert('Product deleted ');
    }
}