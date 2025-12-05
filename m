Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261752BD036
	for <landlock@lists.linux.dev>; Fri,  5 Dec 2025 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933769; cv=none; b=bc0+ZIW8X1O3zh7mwU9t4vn61GBT1GY4jiICMUr5HJAH5BJELFCML1QOWj9L2qmSa7skrEfEQxVy6pO/qO/odLPYXnPLAaNUGc5tRrhujv5B4zBZEniTO2nF2gpS0mhflVXb3lD5Ti5UlIc/GjE72QVBlqjgd0RWGaLdcgQ+gJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933769; c=relaxed/simple;
	bh=oJFbKKZFPUtKDtfFc5ZkZLzx5D0XO1U0HGAmgB8977w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N42HU9FeGoERPlkna+78LZdB0VKDEQRgAcrnhGCmLe433Zyc6ymzvAORF/yX4ZPt3G7ja/GtOiJKBR+vDiugdUZjgsu/KJDl6K41FsQY3FGfRgZqXHsFZ6LplzfKN+4L7M1EY0qtsrw7B61wcITPdj0UyqeXj5zCVDySaoBt4Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=vqE0mVUn; arc=none smtp.client-ip=83.166.143.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="vqE0mVUn"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dN89k1rXFz9Tl;
	Fri,  5 Dec 2025 12:22:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1764933754;
	bh=P7/SNAvxehwVySP+J4NNT2Hdq+hxaMMqD0lo7cddUcc=;
	h=Date:From:To:Cc:Subject:From;
	b=vqE0mVUnSM4UZCPZcgCu2F4xkyPs5mQT0Y/VaW24U024sffblrIcwmoPed7J0jh3y
	 VpxN9jqrBz2Z2qQDQUOquhBhALXPsG+T8lmDhiu9JOkKQ/naYc7StSj3Z2i8m3/29a
	 z/Bm+nXLgFKydnOHNr6NbmvV9PQz1bk1rNveBxxE=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dN89j4GJxzTs2;
	Fri,  5 Dec 2025 12:22:33 +0100 (CET)
Date: Fri, 5 Dec 2025 12:22:28 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: landlock@lists.linux.dev
Cc: oss-security@lists.openwall.com, linux-security-module@vger.kernel.org, 
	lwn@lwn.net
Subject: Island: Sandboxing tool powered by Landlock
Message-ID: <20251205.saiZ2Pauleew@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi,

I just released Island, a sandboxing tool powered by Landlock:
https://github.com/landlock-lsm/island

Island makes Landlock practical for everyday workflows by acting as a
high-level wrapper and policy manager.  Developed alongside the kernel
feature and its Rust libraries, it bridges the gap between raw security
mechanisms and user activity through:
- Zero-code integration: Runs existing binaries without modification.
- Declarative policies: Uses TOML profiles instead of code-based rules.
- Context-aware activation: Automatically applies security profiles
  based on your current working directory.
- Full environment isolation: Manages isolated workspaces (XDG
  directories, TMPDIR) in addition to access control.
- Transparent shell integration: Automatically sandboxes commands in
  your shell without changing your workflow.
- Zero-privilege operation: No root access or special capabilities
  required.
- Layered protection: Multiple profiles compose cleanly with
  deterministic ordering.

It's a work in progress, so be careful.

Feedback welcome!

Regards,
 Mickaël
