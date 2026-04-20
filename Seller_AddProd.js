// Seller page Add Product form Functionality

// Toggle add form visibilty
function toggleForm() {
    const form = document.getElementById("productForm");
    const isHidden = window.getComputedStyle(form).display === "none";

    form.style.display = isHidden ? "flex" : "none";
}

// Show alert for submission of product
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('productForm').addEventListener('submit', function (e) {
        // Prevent page reload
        e.preventDefault();
        // alert message
        alert('Product added!');
        // Clear all form inputs
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