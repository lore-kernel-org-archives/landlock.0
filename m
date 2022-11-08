Received: from saaz.rutschle.net (saaz.rutschle.net [51.15.243.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E4B8C12
	for <landlock@lists.linux.dev>; Tue,  8 Nov 2022 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=rutschle.net; s=20170610; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=02J/K0YfQykEZlGJovPIqlVTY+W1VzuE/Ax7g4mvQj0=; b=NtUF2qrI9Mc6Q/RTuR9gmyahmd
	D51KWfhFJblX2ly49jMiRtVg/3hZ+YOgccA4zMBzLz7BERUAabox1/si4sF9XJxHotyz2G6R4u1YO
	17Ym17fpR3Mibmf5QyJLFEdwaFB4FX5Yjith/ZWULJ/hcT+KdDSsryPySojuyaNsaQKI=;
Received: from yves by saaz.rutschle.net with local (Exim 4.92)
	(envelope-from <yves@rutschle.net>)
	id 1osSBy-0005bQ-5i; Tue, 08 Nov 2022 17:15:18 +0000
Date: Tue, 8 Nov 2022 17:15:18 +0000
From: Yves Rutschle <landlock@rutschle.net>
To: Yves Rutschle <landlock@rutschle.net>, landlock@lists.linux.dev
Subject: Re: Landlock setup
Message-ID: <20221108171518.GC10688@rutschle.net>
Mail-Followup-To: Yves Rutschle <landlock@rutschle.net>,
	landlock@lists.linux.dev
References: <20221107172216.GA10688@rutschle.net>
 <78f7af34-cbd7-eb25-60fb-64385d118d90@digikod.net>
 <20221108112722.GB10688@rutschle.net>
 <f0b57f51-e7c8-41f6-28eb-5dcb11686cc2@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0b57f51-e7c8-41f6-28eb-5dcb11686cc2@digikod.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Nov 08, 2022 at 03:13:39PM +0100, Mickaël Salaün wrote:
> If you see "landlock: Up and running." in the running kernel log, I don't
> see any reason why the kernel would return ENOSYS for the Landlock syscalls.
> 
> The default kernel for Debian 11 is Linux 5.10, which doesn't support
> Landlock. I tested with linux-image-5.18.0-0.deb11.4-amd64 and
> linux-image-6.0.0-0.deb11.2-amd64-unsigned and it works fine.
> 
> On which architecture are you?

Ah, the mystery thickens, as I have a more recent version:

Package: linux-image-5.18.0-3-amd64
Version: 5.18.14-1

# uname -a
Linux hallertau 5.18.0-3-amd64 #1 SMP PREEMPT_DYNAMIC Debian 5.18.14-1 (2022-07-23) x86_64 GNU/Linux

My bad about the version, I guess I upgraded only the kernel
from Sid at some point.

Y.

