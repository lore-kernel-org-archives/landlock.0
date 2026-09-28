Received: from mta1.migadu.com (out-243.mta1.migadu.com [95.215.58.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28D44E9C3F
	for <landlock@lists.linux.dev>; Mon, 28 Sep 2026 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611744; cv=none; b=caQ3avT1bhkT66kBWij3ylA35pb0PJrXS1nte9hWiLiKYtMpQ6mjKiOlwOys7yAk0kDGbJDnFHz27WdZuRFaS0dDw+wOCxJ17tO1ag73xhv5DpPOU/N+Ntk0MhgSh9By0J4A25JJt5UpczBxjYfY9YCM5meWIw+CONP6nG8ctAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611744; c=relaxed/simple;
	bh=Ml0gPFj+r9wcdDw89sXIK4lf9PY+Z2Et8uDMr5Uyvw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dufl4gGLD0M16bkmhP4705O+93SQq1ZY3IM8BgL1Gmn3zAO5ztRV8+x5aPyGB55Hvvta7jZQs/MtlLy5lQSdqVo7Tvts7QQ11BKCjQQufmgysUumRKMjQehzbGxbQqaxJ+vi1er2LeglILMsUrna0RKPN8WquNiizWJjkyXnrms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exn.st; spf=pass smtp.mailfrom=exn.st; dkim=pass (2048-bit key) header.d=exn.st header.i=@exn.st header.b=lKbv+e/X; arc=none smtp.client-ip=95.215.58.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exn.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exn.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exn.st header.i=@exn.st header.b="lKbv+e/X"
X-Envelope-To: landlock@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Ml0gPFj+r9wcdDw89sXIK4lf9PY+Z2Et8uDMr5Uyvw0=;
 c=simple/simple; d=exn.st;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790611736; v=1; x=1791216536;
 b=lKbv+e/XITgNGi0HYGJrl8ci+k70yHgGkoUb6okhADZGfcwPD/Btq7izDFZb9jaWtutpkP8L
 N6TY6x97l36PS+6EOsnQeZOw/0SLX5h7UTja2g4GiS29grJONGIbhLU3R6Nb3VTj50zRxVsvEkJ
 yUajABh8JAN73Pa1Khmb5a0Fj377baF+nMohfUrtxvpTKxmbw2hmmkElTUqewXLIfGQadS5BShs
 DtBSB3VzdASYeDRd3ugMSKOw+dgpaAL9Y68bELeVOpKMdGMoDfqniUG5hKoOBr+ioRDSgtIg0SH
 qlJUgm634HEPJ+f3fnb+lp0NM6mfDtpn06NF1L5nBQKWQ==
X-Envelope-To: landlock@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 32e70ba91018625a;
	Mon, 28 Sep 2026 16:08:56 +0000
X-Mizu-Trace-ID: 32e70ba91018625a
X-Migadu-Flow: FLOW_OUT
Message-ID: <59dac478-5877-44e5-899e-bab571458d2a@exn.st>
Date: Mon, 28 Sep 2026 17:08:51 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Restricting all (ICMP included) network access
To: Justin Suess <utilityemal77@gmail.com>
Cc: landlock@lists.linux.dev
References: <bff77061-37e3-4361-b021-3d1e46be3b87@exn.st>
 <ara5OnFKQCidTeWx@suesslenovo>
Content-Language: en-GB, fr, de-DE
From: Kate <kit-ty-kate@exn.st>
In-Reply-To: <ara5OnFKQCidTeWx@suesslenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 19:18, Justin Suess wrote:
> This doesn't use Landlock, but you can use unshare and create a new
> user namespace and an empty network namespace without root.
> 
> You can demonstrate this with the unshare -Un command.

Thanks! It works well, however it seems that using unshare(2) removes 
one of the advantage of using Landlock: being able to use it in 
conjunction with things like docker.

Using unshare in a docker container i get: Operation not permitted

Is there an alternative option that is able to run in docker?

Cheers,
Kate
