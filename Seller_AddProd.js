// Seller page Add Product form Functionality

// Toggle add form visibilty
function toggleForm() {
    // Get form element
    const form = document.getElementById("productForm");
    if (form.style.display === "flex" || form.style.display === "") {
        // Hide form
        form.style.display = "none";
    } else {
        // Show form
        form.style.display = "flex";
    }
}

// Show alert for submission of product
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('productForm').addEventListener('submit', function (e) {
        // Prevent page reload
        e.preventDefault();
        // alert message
        alert('Product added!');
        // Clear all form ino=puts
        this.reset();
        // hide form after submit
        toggleForm();
    });
});

// Functionality for edit and button
function editDemo() {
    alert('Edit product');
}

function deleteDemo() {
    if (confirm('Delete product?')) {
        alert('Product deleted ');
    }
}