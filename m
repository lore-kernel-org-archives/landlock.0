Received: from mta1.migadu.com (out-109.mta1.migadu.com [95.215.58.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA337579822
	for <landlock@lists.linux.dev>; Wed, 23 Sep 2026 22:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202541; cv=none; b=CH1xKBv2gjDAA9OyhZNQYBgX4lM4DiUi8NMG4zWaDD9O/TqtQC3FaIdtPXsR9zQrjumF9R69XVpVSI6G+rPIIoGaBemEmpwwWb/t+bO0/+l7EusDhYFS8p49vn7xUmmr07DdSxSHJj+RtvsLo5v8O2cGI8gO4GelgkyrAtfKQAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202541; c=relaxed/simple;
	bh=RbtlqGUeKIdZUvRD7rvmaY79VrC9WdPHTvCUzcXI5Oo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=J6eHiKTTgNTY2AJHRLvxLxJUrC7TdhZRXmVW7UiqqYk8UxKn/rgWwvwj+ALgk3MMmSfZeorpA7NgAbKcztEAOQ0BzYQdRjHHjNkYeH2jHptwxn3Y+Yn8TOv6igdzUA89kms9jAcGB+OFyneauIHw02+EeaZKa2GYPDIGOIqXGY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exn.st; spf=pass smtp.mailfrom=exn.st; dkim=pass (2048-bit key) header.d=exn.st header.i=@exn.st header.b=c4qaVwdh; arc=none smtp.client-ip=95.215.58.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exn.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exn.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exn.st header.i=@exn.st header.b="c4qaVwdh"
X-Envelope-To: landlock@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=RbtlqGUeKIdZUvRD7rvmaY79VrC9WdPHTvCUzcXI5Oo=;
 c=simple/simple; d=exn.st;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790202537; v=1; x=1790807337;
 b=c4qaVwdhTk6DVD907YiYojIUDtBCD3Sp/G0bcGYDvU5yFWAmgLV6dnaxGWnxX51bbucsUz3S
 dhM0s53xNymcf55eKnQ4NVjbl/sKR8D89W3OJ0rlbARABTbJefPaAEGSQ7Q+FBySYQHGFzaiJtP
 juZq/J66AsoVLAyDg/3Z0t2ScFUre957lqVvUUrmFHB65SdUevVfhniJdk54jufBsHaFcX5r8nC
 EIkDhDGk/QQ8op2QPDcvCC//m4XdzvPi/ytMzrhMDT8/nT0Hlg9gdBuJ2chaQ3zcgRkS4e8grtR
 kuBBBN2Clt2UDENUcqKZr+nyS5HTWOLKlbBtsBCpIYGcg==
X-Envelope-To: landlock@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4b4ea7e0a45daa3f;
	Wed, 23 Sep 2026 22:28:57 +0000
X-Mizu-Trace-ID: 4b4ea7e0a45daa3f
X-Migadu-Flow: FLOW_OUT
Message-ID: <bff77061-37e3-4361-b021-3d1e46be3b87@exn.st>
Date: Wed, 23 Sep 2026 23:28:57 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, fr, de-DE
To: landlock@lists.linux.dev
From: Kate <kit-ty-kate@exn.st>
Subject: Restricting all (ICMP included) network access
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'd like to use landlock and i've tested the sample/landlock/sandboxer.c 
example from the linux sources, however while TCP and UDP (if i had 
linux >= 7.2 / API >= 10) are correctly restricted from what i can see, 
ICMP (ping) is still able to communicate with the rest of the world. I 
suspect other protocols not based on TCP/UDP are able to do so as well.

I've read somewhere that ICMP can be handled by BFP instead but that API 
seems a lot more complicated than necessary for what i need (maybe i've 
looked in the wrong places though?), so i'm wondering:

Does anyone has any tips on how to make sure no network access of any 
kind is able leave the sandbox?

Cheers,
Kate
