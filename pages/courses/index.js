Page({
  data: {
    title: 'Khóa học',
    courses: [
      {
        id: 1,
        title: 'Kỹ năng nuôi dạy con 0-3 tuổi',
        instructor: 'Thầy Nguyễn Văn Hùng',
        price: 299000,
        rating: 4.8
      },
      {
        id: 2,
        title: 'Tâm lý trẻ tuổi teen',
        instructor: 'Cô Lê Thị Mai', 
        price: 399000,
        rating: 4.9
      }
    ]
  },

  onLoad() {
    console.log('📚 Courses page loaded');
  }
});
