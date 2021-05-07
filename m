Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D35372
	for <landlock@lists.linux.dev>; Fri,  7 May 2021 08:07:17 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2so11590093lft.4
        for <landlock@lists.linux.dev>; Fri, 07 May 2021 01:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=MwSa3up865zGCzbQghrTpGgL0+5TqFWO+iNLgPQ9/sM=;
        b=JVi8aN9svqb1ecSbOafHyV9arrKTAsRGxDSyics9WFfU3isFj3IcecGomJ51b1Uce6
         tabBvrrCaRNUQDwfZ7IFsQgQojqinSrW+eV8Bhyd6XlaNANRT1KbcCEA48U6ulszYmbX
         G5VY6Nwrd2biRU8O4O43FWSECtvWu66sq0AQSULK/TIElf65gyP4szcbVPh1M4Pynvbu
         1IkN+XbiIBNVPqYGIas6nNfbP7/gSWDUapyzQmsMCglqyp/36SYTPSBodCTAmEbIXzE+
         JSTgICPpLfQxTQOz2Ll9kgTTrIwNsYQrr0roMO09SxEcXT7OwTjqaUl+W8vEu8FXIutS
         474w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=MwSa3up865zGCzbQghrTpGgL0+5TqFWO+iNLgPQ9/sM=;
        b=akBJEKHj6NZ77uilk+HozwR9Qy2ejeOMg9s8zmSb+dZXNTWKOES9EIwJmIsiKhctgx
         Tu1K8yb3LXgCD3ALdBYmlUDAir/svuBx3cX7r9x6VXxnEn5gRLH/pxIvc/37vbsCgZO4
         3x8VkuONri3Siekaoy7r1In9tokNgBlkV7HBJjgLaWQ365My4dHQiZ/9Q/4j/NE9g/rc
         7wis7ZfCbyXkEiaeKTft/b04IbGDsAuIIEEszmHxDm/FyaAiukqLzSR62PMigQLkIF9x
         FWY4gqa0SLhdvjqVfpae+wGYGFKRwMvSM1sQKyCi4UNjUShFh5P5C+gjvNZQYrRyhkam
         vRRQ==
X-Gm-Message-State: AOAM533IGqOCsKC6iu/MUBks4DU/E+XU1eIXkJ5KCpFH65VbpP1NdOmS
	elXKW2VlJ3GeM5RK+Ok3DPbeej4gh+U6QBNG+WWyu/Nzo9jdxQ==
X-Google-Smtp-Source: ABdhPJwtgB5zsg/NmxnQS2yDPX5/Jfx6+4MFpCP717ZANIfR7ZgS+ohIONW9GpMH5P9eYclONSjNGBBwa1Ch+We4U5M=
X-Received: by 2002:ac2:464f:: with SMTP id s15mr5547179lfo.329.1620374835345;
 Fri, 07 May 2021 01:07:15 -0700 (PDT)
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Fri, 7 May 2021 13:37:04 +0530
Message-ID: <CAH=dH99_y5+PvNL2V=Q=Pzge1UDOd=-PvxU5K4jZj7Y=UqVnXA@mail.gmail.com>
Subject: Test mail
To: landlock@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Test mail

-- 
Regards
Shyam Kumar [ RHCA ]
Code Aurora Forum Admin Team
The Linux Foundation Collaborative Projects
