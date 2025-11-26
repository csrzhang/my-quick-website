// 文件路径: api/location.js

export default function handler(request, response) {
  // 从 Vercel 注入的请求头中获取信息
  const country = request.headers['x-vercel-ip-country'] || 'Unknown';
  const city = request.headers['x-vercel-ip-city'] || 'Unknown';
  const ipAddress = request.headers['x-real-ip'] || 'Unknown';

  // 记录到日志 (如果需要，但 Vercel 免费套餐通常不提供持久化日志存储)
  console.log(`New visitor from ${city}, ${country} with IP: ${ipAddress}`);
  
  // 返回 JSON 数据给前端
  response.status(200).json({
    ip: ipAddress,
    city: city,
    country: country
  });
}