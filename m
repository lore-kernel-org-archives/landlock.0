Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AB762809
	for <landlock@lists.linux.dev>; Fri,  2 Oct 2026 00:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790902179; cv=pass; b=BjJT+YZvvssIq/Sw9+PuwlCTaU0wLT10N1OB2AC8FDWKuaXTjzO+S/c6hqg4Mx47a8cNaQcV1t60dMQCGs3v0fdFFB7Bf2JMr4qBiQCoRDAKRmUacFhdvoco8jZaahgkrv+l+LRtm4V6BEQXZQPaQ8OU61GgEFDA+0zHo6HSLgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790902179; c=relaxed/simple;
	bh=C3W3TgcE6qmizN1fI7nyQPbOym6e3oEPz1VnvFBy1q8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ciz1Q9gVd2ZNfUuWKKoiCZ+8I4oMs+vrnxTF9Z53vv2VpISQLP+g9gc8J8bBPufN+Wf6CIBuucKfFOS45v7zNrjkXWRcYUsse1B2DpSJKTY5C4AIK0naWdU0hX9za+NyHd2SlyiFQgYJp2UKFUXRiOJsL80hykWoulBJSRsP0bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxL6d4re; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxL6d4re"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a77da28307so19641881fa.1
        for <landlock@lists.linux.dev>; Thu, 01 Oct 2026 17:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790902175; cv=none;
        d=google.com; s=arc-20260327;
        b=ivEqAgZp7O0lJH7oggvQD+xRO0De8p/QeofPTZCZT9B6yRUu4jDIjbsuELvJn0SAel
         6Nx7FzK23ZCEsSD4MzqFUnsXeP20ZbwyxmII3gB4G3E9MgoPJnLM6vFLWEcaupmphEiQ
         +rhVZ7gehFzeTYxVm0/wll2B1ZA/8olA7+IplCjO+BEnag+qJEOKkFPHJsykA2vyrzAf
         J9FDRGdXzFR0Nd2XPz4V3Sx+NSXIrS018Pch9DrYkaoSDdq1lPSluE1igJZEdPiVePHf
         ouSFs6eI96w1H1SfRrZ3UtEso80fYw610vtbapFW9tMS6W+4Efbffk6Pz9Dy1UUZdQHC
         MI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:sender:mime-version:dkim-signature;
        bh=C3W3TgcE6qmizN1fI7nyQPbOym6e3oEPz1VnvFBy1q8=;
        fh=X5G8PphVPABk8weKhdHaOj6gUr2zTKDqIySxLw7bqrY=;
        b=V0scJb3Z6bYGkD1SgU31ko3r/aHEKS5lqkjYfkjv3clE3uSJX4Mdv7g3li9v8U2zLe
         s/mjTHVKIU2iePhIQmuHZYvFL6lDoCJ88wx7nQX49TPErH30hHh/o9wEvsGbE7QNxIkI
         ARP9cWXnPHevZaUycRagDOhJ6MJpkm0eWbmRvj2e/9oV2DvCXFzsuyhSSX6tRdXFKEaV
         KpAKSEyAsp1lwb6uRtHM7vC2YFZWcGk5s/XgxUOoMwevAJqnv5RefE+NWJFvoEc8EJ1X
         DcUFvVkTr1BIrvu8D+XxZNQDSfHIJvBU8fPbKDf0LsYbvwnMMfJduNewbuqQXwjooJK0
         pA3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790902175; x=1791506975; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:sender:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3W3TgcE6qmizN1fI7nyQPbOym6e3oEPz1VnvFBy1q8=;
        b=cxL6d4reBgOtvMGX8J9pfwM8S3+PbUlSQeRVBPtVzfCkJhg5Uq9VZ2l5nR8u2uCJkS
         8BlGiPOsceINlpTNHCy0q+a+wowfmdLd/bOAccbMCwKMHcKTWiQgUcz26YsUoOsW4gEQ
         OA/bV9VAZREpcllH2tOyyhkqGzsNqlf/l/ykk+vhGrfziYGReeMsbn21EZB3RAPuUoML
         g/+OM7E83KA9IMAkVl4tMcEtYWbF+P/JOUtJurItrtkRCTRxOlASQqHUL+31s0T0LNBs
         s/TbR7JE4OhE6r1CFOBwbGTrv4zm5TQSplRrhFuVR8O7iOr4Ev/i6+vacqFprdtQYlLh
         jzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790902175; x=1791506975;
        h=content-type:to:subject:message-id:date:from:sender:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C3W3TgcE6qmizN1fI7nyQPbOym6e3oEPz1VnvFBy1q8=;
        b=2QTtCoGI1WlmJNa2UNWM8uZTbGHCtPaW9xPMD/0yVkCIWVdLAPxEgHJHo/myoqo/j9
         Fmh1rhuzG1Y/AUtMHz8tM8m/T+IN/PLEG5D9uQzUEsCJq9dCuzvNvEyMIIRMuOqMuO/n
         pVTF950ipG6HBcNeCxlE8KcNbhb9NTMGsI9uzpnJbrOiln5yORSIea85tjPjSNyH7u89
         AtWhEAPWAUi1GFSS1H8LiU85+Bb8MGCmGrOSGZOoNgBTuTpBSmoZxUsrgFWB3E23C0O6
         gVq9KmQvFBg2/C0JTbIuAkgvhE6nw3MoienNOLQgJZo1hHjZdsjyoHdoICf9Utm+tqoi
         mY+A==
X-Gm-Message-State: AFq9FYLrk9GshXXUzKHavs0Fg1Tqy7ijNC9uRSLpuyqDTQ89uNQfY9mm
	Pm68ATxRYGm1o9bs2KHyz7kK7a+70z8C6o7+lAuCVEB8VHjcvTjv7XdwSoxw95v/YUlVb9gLzE1
	5YdMIoTSgL19pwFvvSpfxnrI/Qay5gsYIxZFMS11X+w==
X-Gm-Gg: AYBFou2XPV6Q/Sb/WKnixMGbayWR5AuuCqHdyhQlvgYIcQfSr3GDJmqcapKsdlNtpej
	SV98hqpypULzpjjRlR/H1K556pT+HDJsJjudBjxKqgVUVEchh+a5yzwPBBxhf9gDtXHTpOr8d/s
	levoW+1AGkgXElp8Y5+Ik7btyQDoWWnnASt1VAfEGLWu/xgezA885ftCb6Om7rmSpYe6k7/ySsA
	KwzM++kQ5oPBX5ZsgqHBOmG+E7YUtOrGtxZa7cxo+xIY7jV3RMeKnmb8MNyVyoCJAfljS2eHSTY
	R2OEXU3B+8UynsacR6KHHizos0GDxvSrL2kNFF9THQ3EBHkwfYa1rEVz6h9k4OuIR/V45Mo=
X-Received: by 2002:a05:651c:2121:b0:3a8:7b84:be9b with SMTP id
 38308e7fff4ca-3a8877b73a8mr2183941fa.5.1790902175439; Thu, 01 Oct 2026
 17:49:35 -0700 (PDT)
Received: from 985443395752 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 17:49:34 -0700
Received: from 985443395752 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 17:49:34 -0700
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Sender: amandamandison94@gmail.com
From: amandamandison94@gmail.com
Date: Thu, 1 Oct 2026 17:49:34 -0700
X-Google-Sender-Auth: rYqK80UD3xUTsau9kqSt1hBfFog
X-Gm-Features: AclHuK8GeSS-cjKlG0YcMdYP5zAs0SzwdLngIX1NST3LRu_7hRJTwWzyWIvCVHQ
Message-ID: <CACjAds+EzrUAJFStzzTZV4s9=OoPGpOOQOrbz_U_N67NU-DcRw@mail.gmail.com>
Subject: not a spam pitch, promise about workshop-imagemagick
To: landlock@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi landlock-lsm,

Came across workshop-imagemagick today. Spent a few minutes in the
repo nice work.

It's sitting at 8 stars and 2 forks, which honestly feels low looks
more like nobody's found it yet than anything about the project
itself.

I help people get their repos in front of real developers actual
stars, forks and users, not bots or bought numbers.

Want me to send a couple of ideas for workshop-imagemagick?
