Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584ED15278E
	for <landlock@lists.linux.dev>; Sun, 12 Jan 2025 18:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736704980; cv=none; b=Hmxf7q/YSHtPJ9j04XSrAHqZTyJoLitAe/Q1xIYB/GSM09nufmtD+c3SnJ6/nduBWki/pKhQf6kDuaqllGL72CEoB1FKr7mFlh4LBFfxwF5CcZW/5y96anhHqUTb5T1JE4DqC0+M8MNcp68vVNVCZKJwFbN5hig4AUQwUAR2l3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736704980; c=relaxed/simple;
	bh=+0yMNrz0C3FiqfqUjLyRlYHXu+4GNbrlujbX4vGscZQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=YavEFzsKYB3rl3ZACx/bNhWFTsdxJlBbjwhsPjQkq48rbpojhkR5TvRdybLe9OOnxCEprshC7jd7zBhRojQk4yh6/cDS6WG+chv8KnbuOk0E6AZXwus+6MD9tSBFWDXm8qkTG2Uz3RAD5Z76Tk7VZH8myuyMcYKppO6RwjD1e14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kET/CfkO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kET/CfkO"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3047818ac17so28815171fa.3
        for <landlock@lists.linux.dev>; Sun, 12 Jan 2025 10:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736704977; x=1737309777; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+0yMNrz0C3FiqfqUjLyRlYHXu+4GNbrlujbX4vGscZQ=;
        b=kET/CfkOtI0y42ZXMasJTgs0tX9nk+BjbroSmgdPGJIHuO5ml5UFv1xvahNYOQV1BB
         Y4CzK3p5qhLrzcZBwrotXnUUcI1Vs24fh/FvM0A+NcxXlmbXp8sq3Jrkoh1scThy90c5
         ivY83h/8+oxgkvHqsLwjqv6CyMSiqLlkvfWJHAWDJ4yEJKJtR+tiL1hm3qNsrX/HyAGy
         sjhzjzREKhuvAVzm7KF+YmBcPEBB4oBEw/EUJlvFiobj7lGtLTgS8TxUesnS6f11McP0
         3OH3H8MfuAbTPBgumeJhsKzFiGM2yoa6cWXUVkjjGkHO/rZ4MabN4DN6uiwwfTbgcDbb
         NoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736704977; x=1737309777;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0yMNrz0C3FiqfqUjLyRlYHXu+4GNbrlujbX4vGscZQ=;
        b=L+N8lik9Eh/C5kMdKHtwMCF1XIE8BysMWbuCaVoxjIR9veDjew8ORmeFT2oJ1dwmlV
         FsLqSQ8QEe/ImPPPLlE3mnnvwQexJqxHlehO88xW9JnfDMdmIEqGVJ9abeYWKiuGPrlT
         l7PQKmiTaEdREkzo7LL2jdOnT5N93z9uv8bs7q5zJL3dJ9husnXJUCqiDfGA0GJmcwkm
         xnS8vAfdfmG9QSM6sMpulotnB8yIEoXwHBE4qvblvx/uZydvvCtPMZhqi6gHIIusOVj5
         l4paaP1jE7igANFLUN1PnJHTZE3H1pW/gkRRsMa6hYzPSgvmW9wulU+ML6wRGfTpP79G
         7/bQ==
X-Gm-Message-State: AOJu0YykmaymNjyic3bLdI6Vu5IiaYqfnHVeak3uFPzA3pNtx2s1Bb+E
	JkMhIwdSyuLVz0MGRng7Ra2w4B2vXLnxoKeSsTFAaQZRYm6AXExaExlY2IjFwV0XIdlANaHGP5Z
	XJHle8b4uVxf9C0+ptSTkdb+yv1cBKDsV
X-Gm-Gg: ASbGnctQBgNsDd+TKW28sIyah6/5kwxCnQHVz0TmFKwbA0fvy8WZHkkEQFiS8v3aEdV
	LSYojri61OwnTVz0EdpzVrdP05w/7iXrvCZ1SpjWXb7uY5irOdvd/lfkhzoyyTTwcL/7wuHPO
X-Google-Smtp-Source: AGHT+IFQq9LebTeoeYTQ7RstkscEamgE+OGnTBZb2MmGA0lDwduCdKfmcjAFf2DrRAHnL4hMxYoixPFS7EpCjjTY0kg=
X-Received: by 2002:a05:651c:2119:b0:302:5308:ba48 with SMTP id
 38308e7fff4ca-305f455338fmr60554981fa.12.1736704976588; Sun, 12 Jan 2025
 10:02:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Vin=C3=ADcius_dos_Santos_Oliveira?= <vini.ipsmaker@gmail.com>
Date: Sun, 12 Jan 2025 15:02:28 -0300
X-Gm-Features: AbW1kvZrlm8eXGsdwZFpCi375nTMWdhTjOx3FVV3sQmgDlpGDCwcnhL0whR_hWo
Message-ID: <CAK9RveJqRJ5TjZh1jtFmXUaePMRK9d=VWgjk8tFWJShOH9bocA@mail.gmail.com>
Subject: Software Sandboxing: The Basics
To: landlock@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wrote a new blog post about sandboxing principles:
https://blog.emilua.org/2025/01/12/software-sandboxing-basics/

The post is focused on newcomers, so there's a lot of introductory
text that doesn't relate directly to Landlock. The text is also aimed
at a wider audience, so again it doesn't focus solely on Landlock. It
goes from general principles, a little bit of history, and sandboxing
technologies on FreeBSD (Capsicum) and Linux (Seccomp, Landlock).

--=20
Vin=C3=ADcius dos Santos Oliveira
https://vinipsmaker.github.io/
