Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71D472
	for <landlock@lists.linux.dev>; Fri,  7 May 2021 07:51:04 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id p17so4694531pjz.3
        for <landlock@lists.linux.dev>; Fri, 07 May 2021 00:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=ln0DNkj3AbJCDVRKLELuj2WhxuHA++rvY3c36umBl3U=;
        b=kgSTRpjfwPAjyKjkn1pmUnh+YSuvfzhlojxNeRZ0+WliQSwTn5Zf+XoAggj+hoFTFE
         3qKz5yOhFKw9jLGOf/dexiKiKEAj4+00kLfIUE2hl/eD8+P+QR1TOwL5Lp6o0jcX1qgB
         gy8R7Yx8Y045xhQa26dq+V/q9OA1yvz9LdoGNbr0mer+6fK9ERZn4EEetHsKO3ejcTkc
         0pqpKPxeTsj1YlN2QbR6qI1ZPv7/RffbXHsupQW01mDgtpr62l7HsyfKzF590mMecYa5
         hqtuUQnhgVWZSyw6scgsqOrsYrwAsYn7AeXbm1Jd2I8gdhWSxfSBxE1nAQHI21HI6K6t
         w4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=ln0DNkj3AbJCDVRKLELuj2WhxuHA++rvY3c36umBl3U=;
        b=Z8YCJPiKHMe38+SD5k8il5qXgYlQGsiB5jWqo6iVdy/zUNG/KfAM+o9ExrnwkI7L5k
         cVC+huFvsNNlqBgSbDk/fjbjo7QxcYQGNfRdyXPCGggHbWgz4MtBvy3/5A1TsBgvyHDe
         9WjP6ZTbT8pFk68ltUPnoqfG2OlPFXj6vPk+iFUkq4/Y2ty9vAwJwo5ZW+MoAnNqp+D0
         rYzF4g0bORbQHvo9+Rl6lBGF5kQwRDenyYKDvWUsqQQzndEoBiLh2tVS0zzRfdTFvg+R
         JI6i8kmLYpDiXBGzT5fSSF4t+YLOp/lVHR/iMPxfxdRD2vJBrPlgAWvUBmybKYeY4cxh
         IaAA==
X-Gm-Message-State: AOAM532myHOLRTko0ylMxUwlCi/FxBtchh6rSartUaKdrsIHzsJp6upE
	2ICDPWRddZh87xqn1g9g8heb3DsqLhtocpnu
X-Google-Smtp-Source: ABdhPJze23ela+VkwLN3mIfryROAgDOZqBXJ73cMWCPteb0rZ7f9I5vArBoxV0t29VzyxjrZVWxCwQ==
X-Received: by 2002:a17:90b:3591:: with SMTP id mm17mr8850364pjb.184.1620373864030;
        Fri, 07 May 2021 00:51:04 -0700 (PDT)
Received: from shyamkv.home.local ([103.160.233.95])
        by smtp.gmail.com with ESMTPSA id n20sm3808510pjq.45.2021.05.07.00.51.02
        for <landlock@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 May 2021 00:51:03 -0700 (PDT)
To: landlock@lists.linux.dev
From: Shyam KV <skachukattu@contractor.linuxfoundation.org>
Subject: Test mail
Message-ID: <e939891a-3692-c626-e06d-6a2f340081bd@contractor.linuxfoundation.org>
Date: Fri, 7 May 2021 13:20:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Test mail

