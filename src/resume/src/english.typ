// import from template
#import "../template/template.typ": *;
#show: template;

#init(
  name: "Baitian Liu",
  goal: "Focusing on interdisciplinary research across computer science and meteorology,
    exploring innovative AI4Science applications for weather forecasting and efficient decision-making",
  // If the avatar is not needed, comment out pic_path or set it to empty.
  pic_path: "/img/avatar.jpeg",
)

#info(
  color: rgb(0, 0, 0),
  (
    icon: fa_email,
    link: "mailto:Baitian%20Liu<sonderliu@hdu.edu.cn>",
    content: "sonderliu@hdu.edu.cn",
  ),
  (
    icon: fa_phone,
    link: "tel:+86 1331 1079 880",
    content: "133 1107 9880",
  ),
  (
    icon: fa_weixin,
    link: "Max1ndex",
    content: "Max1ndex",
  ),
  (
    icon: fa_github,
    link: "https://github.com/sonderlau",
    content: "sonderlau",
  ),
)

#resume_section("Education")

#resume_item(
  "Hangzhou Dianzi University · School of Computer Science",
  "M.Eng. Student | Software Engineering",
  "GPA 3.24/4.00   Advisor: Prof. Haiping Zhang",
  "2023.09 -- Present",
)

#resume_item(
  "Hangzhou Dianzi University Information Engineering School · School of Computer Science",
  "B.Eng. | Software Engineering",
  "GPA 4.2/5.0",
  "2019.09 -- 2023.06",
)

#resume_section([Experience])

#resume_item(
  "Zhejiang Branch, Chinese Academy of Meteorological Sciences",
  "Algorithm Development and Research Intern",
  "Hangzhou, Zhejiang",
  "2024.09 -- Present",
)
#resume_desc(
  "Scope",
  "Based on data resources and expert guidance from the Chinese Academy of Meteorological Sciences, designed and developed deep learning models for precipitation nowcasting, covering data preprocessing, model training, and integration into operational scenarios",
)

#resume_desc(
  "Outcomes",
  "Developed two precipitation nowcasting models for operational pain points and started integrating them into practical meteorological workflows.
1. Fast multi-lead precipitation nowcasting model (0--2 h): avoids error accumulation from autoregressive forecasting. With adversarial training and multi-lead information embedding, it outperforms traditional numerical weather prediction while providing higher spatiotemporal resolution (1 km, 6 min).
2. Extreme precipitation forecasting model (0--1 h): shifts modeling from the numerical domain to the frequency domain and introduces a new architecture and optimization strategy for multi-scale precipitation features. It performs strongly on extreme events, especially preserving details at longer lead times.
",
)

#resume_section("Publications & Patents")

- [SIGKDD] *Baitian Liu*, Haiping Zhang, Huiling Yuan, et al. WADEPre: Wavelet-based Decomposition Model for Extreme Precipitation Nowcasting with Multi-Scale Learning. (*Under review, CCF-A*, first author). 2026
- [IJCNN] *Baitian Liu*, Haiping Zhang, et al. AMU-Net: Physics-Aware Adaptive Mamba U-Net for Efficient Multi-Lead Time Precipitation Nowcasting. (*Accepted, CCF-C*, first author). 2026
- [Patent] Xujian Fang, *Baitian Liu*, et al. Extreme precipitation nowcasting method based on wavelet-domain decoupling and multi-curriculum learning. (*Published*, CN121835455A), 2026.
- [Patent] Haiping Zhang, *Baitian Liu*, et al. Multi-lead precipitation nowcasting method based on joint spatiotemporal feature extraction. (*Published*, CN120654887A), 2025.
- [Patent] Haiping Zhang, *Baitian Liu*, et al. Monocular vision planar distance measurement method based on rectangular information. (*Granted*, CN116678370A), 2023.
- [Patent] Liming Guan, *Baitian Liu*, et al. Glass plane velocity measurement method based on binocular telecentric lenses. (*Granted*, CN117110642A), 2023.

#resume_section([Selected Projects])

#resume_item(
  "AI-based Meteorological Forecasting Models",
  "Core Algorithm Development and Research",
  "Partner: Zhejiang Meteorological Service",
  "2024.09 -- Present",
)
#resume_desc(
  "Overview",
  "Collaborated with Zhejiang Meteorological Service to develop deep learning-based meteorological forecasting models for operational forecasting needs, aiming to improve the accuracy and efficiency of precipitation nowcasting",
)
#resume_desc(
  "Contribution",
  "Responsible for radar data preprocessing, quality control, and completeness checks; designed and optimized deep learning models; developed forecast visualization tools and completed operational scenario evaluations",
)
#resume_desc(
  "Outcomes",
  "The model outperformed traditional numerical weather prediction during the 2025 Meiyu season evaluation, reaching 1 km and 6 min spatiotemporal resolution with much lower inference time than numerical models, addressing the real-time limitations of short-term forecasting. Research on diffusion-based probabilistic forecasting is ongoing and is expected to further improve heavy-tailed precipitation prediction",
)

#resume_item(
  "Computer Vision-based Bayberry Object Detection",
  "Core Algorithm Development and Research",
  "Partners: Zhejiang Meteorological Service, Xianju Meteorological Bureau",
  "2024.12 -- 2025.10",
)
#resume_desc(
  "Overview",
  "Collaborated with Zhejiang Meteorological Service and Xianju Meteorological Bureau to develop visual algorithms for bayberry maturity detection and deploy them in bayberry orchards",
)
#resume_desc(
  "Contribution",
  "Responsible for algorithm research, feasibility exploration, feature analysis, and post-processing of the collected dataset",
)
#resume_desc(
  "Progress",
  "Built an initial YOLO-based object detection model that meets expected recognition performance in open orchard scenarios across multiple seasons. Maturity prediction and large-scale statistical analysis are under development and may support bayberry sales in the Xianju region",
)

#resume_item(
  "Glass Plane Velocity Measurement with Binocular Telecentric Lenses",
  "Algorithm Development and Device Integration",
  "Partners: Shanghai CEC Electronic System Engineering Co., Ltd.; Rainbow (Hefei) LCD Glass Co., Ltd.",
  "2023.06 -- 2024.11",
)
#resume_desc(
  "Overview",
  "Developed a high-precision velocity measurement algorithm for 0.3 mm glass sheets in high-temperature and high-humidity industrial environments, controlling error within 0.6 mm/s",
)
#resume_desc(
  "Contribution",
  "Led the design and implementation of the velocity measurement algorithm, completed telecentric camera and temperature sensor debugging, designed the UI, and deployed the algorithm on an industrial mobile computing platform",
)
#resume_desc(
  "Outcomes",
  "Solved recognition challenges caused by glass transparency. Through precise edge localization and clock synchronization, the system achieved the target measurement accuracy. It ran stably at 80°C and 75% relative humidity, and the insulated enclosure plus self-checking functions significantly reduced defect rates in industrial production",
)

#resume_item(
  "Fast and Accurate Measurement of Australian Redclaw Crayfish via Skeleton Recognition",
  "Algorithm Development and Device Integration",
  "",
  "2023.10 -- 2024.07",
)
#resume_desc(
  "Overview",
  "Implemented fast and accurate daily growth measurement for crayfish to support and accelerate breeding of new varieties",
)
#resume_desc(
  "Contribution",
  "Led algorithm design and implementation, including data processing, model training, and supporting device design",
)
#resume_desc(
  "Outcomes",
  "Used skeleton keypoint recognition together with telecentric lenses to accurately locate and measure crayfish claw length. Combined with a staged detection workflow, the system enabled fast and stable crayfish data acquisition and analysis",
)

#resume_item(
  "YOLO-based Rural Miscellaneous Pile Recognition",
  "Algorithm Development Lead",
  "Partner: Yunzhihaihui Information Technology Co., Ltd.",
  "2023.06 -- 2024.12",
)
#resume_desc(
  "Overview",
  "Developed a YOLOv8-based detection and recognition system for rural road trash bins, garbage, and miscellaneous piles, including closed-lid and overflow status detection for trash bins, supporting automated supervision of rural streets",
)
#resume_desc(
  "Contribution",
  "Responsible for dataset collection and augmentation, YOLOv8 model tuning to improve miscellaneous pile detection accuracy, and development of dedicated modules for trash bin status detection",
)
#resume_desc(
  "Outcomes",
  "The system achieved over 95% detection rate and 98% accuracy for trash bin closed-lid and overflow detection. It was successfully applied in the digital platform for beautiful countryside governance, significantly improving rural environmental supervision efficiency",
)

#resume_section([About])

During my graduate study, I have built a solid foundation in software engineering and artificial intelligence, and demonstrated strong practical ability and innovation through the *development and deployment of multiple interdisciplinary projects*. I am proficient in deep learning algorithm design, data processing, and system integration. As a *major contributor* to projects in meteorological forecasting, industrial velocity measurement, and environmental monitoring, I have helped deliver systems that were successfully applied in real-world scenarios. I have strong *independent problem-solving ability* and teamwork skills, and can efficiently handle complex technical challenges.

In future work, I hope to use deep learning to solve interdisciplinary problems in meteorology, industry, and related domains, promoting innovative AI applications in science and producing outcomes with practical value and real-world impact.
