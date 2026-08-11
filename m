Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0285443A9A
	for <landlock@lists.linux.dev>; Tue, 11 Aug 2026 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450641; cv=none; b=jJ18gmcz6bNLgu6Re7UA/u8GfSWoGOVOXfEJTKMPXlAU12uJBeHcnduNr0GqpwsdXxdc7NIvQwdqAFCRg6MODsiMCw+sgBA8tanMIKZMRwZjQKGVN1g15iX2VsX+ENX9IvkjZTdF1DHQhqiXQcNE8CvjTRPPUUp2gf1AY7Jj6IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450641; c=relaxed/simple;
	bh=CXK5uX8BblYiyqese3Rmc9zivINpwa+Wux8OR4b/sZU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=FLBhnsKw+32elwjD4wXJNc5bg9OqzlkQ82AlZxgkPLOEebGhv4lX478jD2/Ej4T/DcP2Lr4ENV3yVi4HCLDRqPaN8yTfY821Dq4WxF2XI2aZMBzVowx/MN8KJyoK6T5iOeov7oEPlnkkzF+c1g+J6c6JK5oHceum+ApI4Dyuias=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decentstat.es; spf=pass smtp.mailfrom=decentstat.es; dkim=pass (2048-bit key) header.d=decentstat.es header.i=@decentstat.es header.b=FNON6rlI; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decentstat.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=decentstat.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=decentstat.es header.i=@decentstat.es header.b="FNON6rlI"
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=decentstat.es;
	s=key1; t=1786450637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hjTp8S+n2wgVvIyb+RFd4HcYRyLns0bBYRa0vlPWjZs=;
	b=FNON6rlI9usgkTxBThnWbe+l1Gn+pMbFb8U+ngxEa6vG12EtY162Zd0/fZrir659AI7HJ2
	al1xKeLGWJ/W/4JEicWlHqTKEIuybZO8+XJSA1wvYzg0m9V/7Wyqh6/VQoyz5a+HYSjVQo
	v6femK6Dy0KX+Gt66ciTb0d8djebBno9XzvuCtiqAnl602t7bd7lgbs8TKXQ8iZc+OUU69
	/F6T2Vb1Gm+VyoT6/A/YX95+nh6yK4iAtZkHWlpCXO63gfVASj+XvmWS7xCIjoVgaDMzQe
	mhQx7UyZxs8L4Fv93xj3HDiS63JvHNI7StAbsK2yjATWusrqa4T+uxDh4jZt9g==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 22:15:49 +1000
Message-Id: <DKM3V8SVKML2.208I9QXXFVNI2@decentstat.es>
Subject: nix-housing: live inside a sandbox
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "decentstates" <ds@decentstat.es>
To: <landlock@lists.linux.dev>
X-Migadu-Flow: FLOW_OUT

Hi,

I've built a data-isolation tool based on Landlock (via go-landlock):
https://codeberg.org/decentstates/nix-housing

It is different from existing tools in that:
- It is made for creating environments with mutually exclusive data
  access.
- Programs and program configuration is combined with sandboxing.
- Made to integrate at the WM level.

It is closest to Island, which was my starting point in creating this
tool.

Here are some blog posts explaining it:
- https://decentstat.es/posts/shai-halud-nix-housing/
- https://decentstat.es/posts/nix-housing/

It is tied into nix but the concept should be translatable.

Small nixos discourse discussion here:
https://discourse.nixos.org/t/nix-housing-live-inside-a-sandbox-better-hygi=
ene-for-your-shell/79501


Disclaimer:
Non-vibecoded, I wrote the code 90% myself, trying to keep it minimal
and simple, with the main exception being wayland-security-context.c
which I plan on auditing later.


Regards,
decentstates
