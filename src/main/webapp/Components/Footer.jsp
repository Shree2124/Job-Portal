<!DOCTYPE html>
<html>
  <head><style>
  

/* Footer Styling */
.footer {
    background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
    position: relative;
    overflow: hidden;
    margin-top: auto;
}

.footer::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, 
        transparent, 
        #0d6efd, 
        #6c757d, 
        #0d6efd, 
        transparent
    );
    background-size: 200% 100%;
    animation: gradientMove 4s ease infinite;
}

@keyframes gradientMove {
    0%, 100% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
}

.footer::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: 
        radial-gradient(circle at 20% 50%, rgba(13, 110, 253, 0.1) 0%, transparent 50%),
        radial-gradient(circle at 80% 80%, rgba(108, 117, 125, 0.1) 0%, transparent 50%);
    pointer-events: none;
}

.footer .text-center {
    position: relative;
    z-index: 1;
}

.footer p {
    font-size: 1.2rem;
    font-weight: 600;
    letter-spacing: 1px;
    margin-bottom: 2rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    animation: fadeInDown 0.8s ease-out;
}

@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.footer ul {
    padding: 0;
    margin: 0;
    animation: fadeInUp 0.8s ease-out 0.2s both;
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.footer ul li {
    font-size: 1.05rem;
    padding: 0.6rem 0;
    color: rgba(255, 255, 255, 0.9);
    transition: all 0.3s ease;
    position: relative;
    display: inline-block;
    width: 100%;
    font-weight: 500;
}

.footer ul li:nth-child(odd) {
    animation: slideInLeft 0.6s ease-out;
}

.footer ul li:nth-child(even) {
    animation: slideInRight 0.6s ease-out;
}

@keyframes slideInLeft {
    from {
        opacity: 0;
        transform: translateX(-30px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

@keyframes slideInRight {
    from {
        opacity: 0;
        transform: translateX(30px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

.footer ul li::before {
    content: '';
    position: absolute;
    left: 50%;
    bottom: 0;
    width: 0;
    height: 2px;
    background: linear-gradient(90deg, transparent, #0d6efd, transparent);
    transform: translateX(-50%);
    transition: width 0.3s ease;
}

.footer ul li:hover {
    color: #fff;
    transform: translateX(5px);
    text-shadow: 0 0 10px rgba(13, 110, 253, 0.5);
}

.footer ul li:hover::before {
    width: 80%;
}

/* Alternating colors for developer names and IDs */
.footer ul li {
    color: #87CEEB;
    font-weight: 700;
    font-size: 1.15rem;
    letter-spacing: 0.5px;
}

.footer ul li {
    color: rgba(255, 255, 255, 0.7);
    font-family: 'Courier New', monospace;
    font-size: 0.95rem;
    margin-bottom: 1rem;
}

.footer ul li {
    color: #FFB6C1;
    font-weight: 700;
    font-size: 1.15rem;
    letter-spacing: 0.5px;
}



@keyframes wave {
    0%, 100% { transform: rotate(0deg); }
    25% { transform: rotate(20deg); }
    75% { transform: rotate(-20deg); }
}

/* Copyright section */
.footer-copyright {
    margin-top: 3rem;
    padding-top: 1.5rem;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    position: relative;
    z-index: 1;
}

.footer-copyright p {
    font-size: 0.9rem;
    color: rgba(255, 255, 255, 0.6);
    margin: 0;
    animation: fadeIn 1s ease-out 0.5s both;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .footer p {
        font-size: 1rem;
    }
    
    .footer ul li {
        font-size: 0.95rem;
    }    
    .footer ul li {
        font-size: 1rem;
    }
}
</style>
</head>
<body>

<div class="footer pt-5 p-5 mh-100">
    <p class="text-center text-white">Design and Develop By:</p>
    <ul class="text-center text-white" style="list-style: none">
        <li>Shree Alasande</li>
        <li>VU1S2526019</li>
        <li>Harsh Shinde</li>
        <li>VU1S2526020</li>
        <li>Kunal Jadhav</li>
        <li>VU1S2526019</li>
    </ul>
    
    <div class="footer-copyright text-center">
        <p class="text-white">
            &copy; 2025 Online Job Portal. All Rights Reserved.
        </p>
    </div>
</div>
</body>
</html>
