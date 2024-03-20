Received: from saaz.rutschle.net (saaz.rutschle.net [51.15.243.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31C2E64F
	for <landlock@lists.linux.dev>; Wed, 20 Mar 2024 10:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.15.243.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710931634; cv=none; b=XZ0profT7GeQnvyePsN678R81aOgDNGaJbQuGTeSlfOM7Xqnp7j0kxt9qNQYJZDOH0V3lurQPBX3S/d4aE+yovjxZh1dYWcIkX4ysfVMxFAN+2lljoP9EwosK6HvEf0nd/DWrRGj5ydjgClF/SePScRkh+N+ehDP8HY/ZDV4bDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710931634; c=relaxed/simple;
	bh=qLGr/rCgm/40yidK0RshW3vkICWTfUh5+lf+Aw6zKVg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rp+RAfnF2w9cwrANn6Lcr+Hs5XxgRjAwQ9U5jLLjQmGe9f2OymiRkRu9uoOJIqbW2EAfJxBfmsuXVYwQHsb/c21EUsjFxgnwK0IQ83QiaefjqMDR21SDuAsnTP2lvhZgOenEH2H51bIQXFftAqYcVn3kKJE9mDjJIM6T3d77Uec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rutschle.net; spf=pass smtp.mailfrom=rutschle.net; dkim=pass (1024-bit key) header.d=rutschle.net header.i=@rutschle.net header.b=pqdjllpK; arc=none smtp.client-ip=51.15.243.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rutschle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rutschle.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rutschle.net header.i=@rutschle.net header.b="pqdjllpK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=rutschle.net; s=20170610; h=Content-Type:MIME-Version:Message-ID:Subject:To
	:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qLGr/rCgm/40yidK0RshW3vkICWTfUh5+lf+Aw6zKVg=; b=pqdjllpKA3T46+rd/GEoclRm31
	1WYE+z0ZZN0TI+RSAc63NWeFMIdsHb3TU/Ztcy/fbpFf/M31s9UNGskr3oUxWnnKrqXUF/R0jtOvY
	l1bCqfd4lsta8802T6rGrCJ8kVfHbOfKlyzLGD0BSTp9Kkp2Td2ycWhB2k0lnBTt9Iag=;
Received: from yves by localhost with local (Exim 4.96)
	(envelope-from <yves@rutschle.net>)
	id 1rmtCB-0050GA-0e
	for landlock@lists.linux.dev;
	Wed, 20 Mar 2024 10:29:19 +0000
Date: Wed, 20 Mar 2024 10:29:19 +0000
From: Yves Rutschle <landlock@rutschle.net>
To: landlock@lists.linux.dev
Subject: Landlock support in sslh
Message-ID: <Zfq6f30spnYCx_9Y@rutschle.net>
Mail-Followup-To: landlock@lists.linux.dev
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello all,

FYI, Landlock has been (finally) added in sslh 2.1.0,
released just now:
https://www.rutschle.net/tech/sslh/download.html

Compared to two years ago when I tried, Landlock is now
perfectly integrated in Debian and no trouble at all to use.

Cheers,
Y.
