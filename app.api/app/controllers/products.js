const productService = require('../services/products');
const asyncHandler = require('../utils/asyncHandler');
const ApiError = require('../utils/ApiError');

const getProducts = asyncHandler(async (req, res) => {
  const products = await productService.getAllProducts();
  res.json(products);
});

const getProduct = asyncHandler(async (req, res) => {
  const product = await productService.getProductById(req.params.id);
  if (!product) {
    throw new ApiError(404, 'Product not found');
  }
  res.json(product);
});

const createProduct = asyncHandler(async (req, res) => {
  const product = await productService.createProduct(req.body);
  res.status(201).json(product);
});

const updateProduct = asyncHandler(async (req, res) => {
  const product = await productService.updateProduct(req.params.id, req.body);
  if (!product) {
    throw new ApiError(404, 'Product not found');
  }
  res.json(product);
});

const deleteProduct = asyncHandler(async (req, res) => {
  const product = await productService.deleteProduct(req.params.id);
  if (!product) {
    throw new ApiError(404, 'Product not found');
  }
  res.status(204).send();
});

module.exports = {
  getProducts,
  getProduct,
  createProduct,
  updateProduct,
  deleteProduct
};