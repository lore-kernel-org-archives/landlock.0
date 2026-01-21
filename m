Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ED531A7F6
	for <landlock@lists.linux.dev>; Wed, 21 Jan 2026 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.172.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998913; cv=none; b=FgJOtoQ6j2ij+cRyhmosItRZXX28OfWCBK6UxTQggb5zqmDPLv6TLHjnoKDiioq3PXf66Nfar9JHGvTyI+FsHkd3aGYRnKx8IZzETFsJKZVLyCqZQx8kN6AmlSg/Uc/FCBpumyJgS4AlrRym0Df1l749MHcAbkkwTT35lew2vac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998913; c=relaxed/simple;
	bh=SN06XEBnCvvOWLSFsinnnQWLwanp4AoTCSs802c/GHE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=Edk+3KonF+c4zjM5EgCnhNnoeXYsldZtbDo197c9Ms2bbd9Y1FTbVcjBXqjxakDzRfM6m16FvIiN3jsR7SvdJuPAaSJzFzka3rXu0BRqaDwy9KUAY+9qCxWVfEiboFJmkrdgiQDer/MhmGx3YbawplWKYj6G2YicN45usukPfJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lausen.nl; spf=pass smtp.mailfrom=lausen.nl; dkim=fail (0-bit key) header.d=lausen.nl header.i=@lausen.nl header.b=uHS3IKkF reason="key not found in DNS"; arc=none smtp.client-ip=95.143.172.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lausen.nl header.i=@lausen.nl header.b="uHS3IKkF"
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 2295460E45
	for <landlock@lists.linux.dev>; Wed, 21 Jan 2026 13:26:20 +0100 (CET)
Received: (qmail 4428 invoked by uid 990); 21 Jan 2026 12:26:20 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Wed, 21 Jan 2026 13:26:19 +0100
Message-ID: <51626227-c97a-4815-8834-303e816abdb3@lausen.nl>
Date: Wed, 21 Jan 2026 12:26:18 +0000
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Leonard Lausen <leonard@lausen.nl>
Subject: Dynamic/USB device support (mechanism to handle changing inodes)
To: landlock@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.942583) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.032583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:subject:date;
	bh=SN06XEBnCvvOWLSFsinnnQWLwanp4AoTCSs802c/GHE=;
	b=uHS3IKkFVkBOHthOgMAsXQtrk3+Nv40rjIVG1YcD/yWntalUrETB82ik478P5envat37ANQ/+c
	cNZHls7RdxzJGuTk8SWVBVX9usdaTXniyB0tpFJfv8DB6Sbo5wfPFZcRQbM3HqPfa9CskDdbJ2oR
	gHFWcQP9jLAqaJLuHRc7HIdor7SvApwgEsRI9KgWIymJnkNFWR9hXdsAqf5aFPLmODMggAl9sNys
	FebG6p53OvXCUxXccCu3/AE+/hO2MXtpZyvI74hZHmfh88Lmg1hlwYDli5k0+CyIfjUNqr0zUMkM
	yIEjPgIFIX8EUVSMLwqv+KYOP3IeOBPBRXwT5DERI+/apRwY/kjU19rSFtt/JsPPBTL9MvZuII3J
	DNvCTo8nL7xQH18c7j/08S4gWeeJqGowqJTU26yfUWdpUlrjyexfceeFdHewffKDNRBKLPTfupW/
	vEdv45B2X6cdbmu8HQfXB+V6Lt71HANA+f40PuHkIAizhW0KbYZp/qW7+FfeUpYCZkSn+2BIJA91
	64X98Uza+b4G8tRElACNuuNLgdoJqvuo7oI1jyjoqg3l06QBKEl6Ac1CE7LlF2+r7j/viglGYV2V
	5R6BjKypM7a87UIuWz5kN1aIrIQ+pHivrhiV/7KIL0byX0bV/L1ZzKhIx2jQGyfSAKqGYvWIRR6w
	k=

Hi  all,

Landlock currently works fine initially to grant sandboxed applications 
access to USB devices, such as a serial device like /dev/ttyACM0. But 
when the device resets itself or is unplugged and replugged, it gets a 
new inode, and Landlock blocks access because the rule was bound to the 
old inode.

Would it be possible to support rules with respect to dynamic devices 
that change inodes? It may required path-based rules or a mechanism for 
updatable rulesets? Or do you have any other suggestions?

Currently, the only workaround is to grant full access to /dev which is 
not ideal as the sandboxed applicaion can then access sensitive 
information or escalate privileges via /dev/pts or /dev/tty.

Thank you
Leonard
