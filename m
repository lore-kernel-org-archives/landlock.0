Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D2247F2CD
	for <landlock@lists.linux.dev>; Wed, 29 Jul 2026 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329027; cv=none; b=chNgRwfahFR9UzGeHCVjQ5RFgp34TppB23caNuPuQL6oH0IH5FVWwoASRSbc7JWCFvR1Ev7z5VPSlf0F9TEuKD/J0T6M9N9U5HR/0bJNg25ggr7Gzq3dhgZnN2KEQvX+g86FOl8d67ezzJwxOaqQEkcvnNcWvBsxPFbo+irHRuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329027; c=relaxed/simple;
	bh=5EHl2dbMLZ3AccGJ8Fu0EBLUJpuZtxxjd0tZw966sh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O+8zOCdz1oL8pwISsHG/mu9D8w/ZuQKoppBHS6yVh7KUbTdgZukB6F9a6aVN4+WvVHmigfcb2TDKfTIFWbg/IgFW5GjmfmR05j3Mz64jRDc+EkSHwawn5bVpurJYZ0frl6GHAOQiALVd3eItHD0jmwB0XAOAoMAMmsOWBG8l3r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEeasUSZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEeasUSZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49553515a8bso11660305e9.1
        for <landlock@lists.linux.dev>; Wed, 29 Jul 2026 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329018; x=1785933818; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G4/EsKrPykPMUjkQSazyjrWyo/mw3UZZuj2/aHPNW7Q=;
        b=JEeasUSZMC04yAHgt60v5vdMf1f7rF7QINDL83GFs/ZYMSOSfmEf7psHoY6p15DTH/
         SpMNbkUxkk84IoXyKiZwY/DJi0k0NxDCZmMo9KmNBuaQDA+cyRWV1ipLCsls/a/Nvzz/
         RVaGS+/J6/9yebprTmkxVaMB1sHeNkUC9jg/ODiDetMNRSlwBCeikG0In/c8GGEY5MxB
         18Jkth1+8PUfuhku+0IncyyAhAwfzMz2bJKm7It/qNB67xt41YZW+qaZ21ovNFKBF6DF
         ssfa7udPInQlM/P+PYF1qMDppQT/s8nFytsRn0Rq8OiHehHra2pl8ydmBITuO+BJxplI
         mvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329018; x=1785933818;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4/EsKrPykPMUjkQSazyjrWyo/mw3UZZuj2/aHPNW7Q=;
        b=WwAGqE015H4GfznWlJCFTO2pl6FwrxH2mkzWHrWkXGbKlIhfw43FgD+N2N3tkkVAET
         fwcoBwLmk8eRMY2+FCW3x7khFNM9XtHhXyBX//Gp48pl7yP0T/I/puc1avC7C2orTkt8
         WndhG68TP0yvgZasHOuQNyQXZxIdv7vUzWz482sFjtVm5LKdRntaUWBsJFfI+9aKwjCk
         rZAm1CG8b5Mvs1AWUeFnwm79M+/IaQ2u2+Rabe5HL98bXSrtJj2acbbmI4tRME5i7a+o
         yOpPWCrinnqeM4nzBUvxY9vu0Biib5+UoIpK3omufHMnl2vjvTN1xOdSh99DUWcsZqOS
         Togg==
X-Forwarded-Encrypted: i=1; AHgh+RoRyfjaMwMPAfudcuQ9Z3U4LZ9t8rkS8cdC+8ZmDSpQl9yy5GXFyJPwTOjN6ZZ0h1x80jYLh8y9mw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt5O+6U9qye/+Zx0Ig09iG/VqB4+e6BE74046KJlcvzXo2M6fS
	g/+mfvsRF5W4c5nAaP/GQZ7FoOBhpctfKTmlkHar7e+2YMleO3tJrRrx
X-Gm-Gg: AR+sD13NfQg0vYt/NHqDWVPqV/7E4CU6ZyWbZRgCYuXj97b1J5XA3KRsRtvJIQhVEML
	11jJkmeTwX2teq1v52XUI0mqTdPn2XBLPbgLbX/xx8CUGvC/q1zb9/Yd0MRt67y8wBTs+kq9tMj
	Fdbs5IqDh/PGSoknC1/8uCmW6Dzy69O6OvcWUtwqe9EvyoU1juuLAeYf5V6NT9K6I/7lrKRUHTn
	AuXJ7sE+9GJIKAPBROifRgDa0EoakOOenn0Ax4uDqv1HGp5LIGgJogPtYcNBXs+zGs9IcVyyfFW
	eovlOFAZVzOvhch5ZWoPRxxxBb9DxBEJEU+VXwrHcXbVMYcB6lGXR4Q4qQFCo7bGiRcDgvDg2Z1
	SrQCkF7tBsntRs8fPru1PXm/Q1Ywg2hFb2JmpR4ZG38Giih+SAl9MRPAJUBTZwa6x0FnHMl6PLd
	u2g+kzd/21ZBphdydOHuMC1k9+W1vvmfGSdnsOYcuqb2+Ci0x8qoym8pdPWMLjzwah3JDQAgvEY
	Z6/xXRezI6Av2m8Qcs24g==
X-Received: by 2002:a05:600c:46cc:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-496c6586337mr72739245e9.32.1785329017863;
        Wed, 29 Jul 2026 05:43:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c6:647b:ba01:60ae:5bf3:4eae:ab18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm137177215e9.10.2026.07.29.05.43.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 05:43:36 -0700 (PDT)
From: Oxana Kharitonova <webprosto@gmail.com>
To: mic@digikod.net
Cc: brauner@kernel.org,
	gnoack@google.com,
	kernel-team@cloudflare.com,
	landlock@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	oxana@cloudflare.com,
	paul@paul-moore.com,
	serge@hallyn.com,
	viro@zeniv.linux.org.uk,
	wangyan01@kylinos.cn,
	webprosto@gmail.com
Subject: Re: [PATCH 0/6] landlock: Add POSIX message queue scoping
Date: Wed, 29 Jul 2026 13:43:35 +0100
Message-Id: <20260729124335.3160-1-webprosto@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260728.Heephie1tai3@digikod.net>
References: <20260728.Heephie1tai3@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Jul 28, 2026 at 12:03 PM Mickaël Salaün <mic@digikod.net> wrote:
>
> Hi Oxana,
>
> Thanks for this patch series.  Overall it looks good but you'll find
> some feedback to improve and send a v2, following Günther's and Justin's
> ones.
>

Thank you all for the reviews!

Just a quick heads-up: I'll be on vacation for the next few weeks, but I'll continue working on this once I'm back. Also, any further communication will come from my personal email, as I've left my current job.
