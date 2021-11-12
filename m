Received: from buxtehude.debian.org (buxtehude.debian.org [209.87.16.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE962C82
	for <landlock@lists.linux.dev>; Fri, 12 Nov 2021 11:58:54 +0000 (UTC)
Received: from debbugs by buxtehude.debian.org with local (Exim 4.92)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1mlUno-0002H0-9Z; Fri, 12 Nov 2021 11:33:04 +0000
X-Loop: owner@bugs.debian.org
Subject: Bug#999551: Support Landlock by default in Debian kernels
Reply-To: =?UTF-8?Q?Micka=C3=ABl_?= =?UTF-8?Q?Sala=C3=BCn?= <mic@digikod.net>, 999551@bugs.debian.org
Resent-From: =?UTF-8?Q?Micka=C3=ABl_?= =?UTF-8?Q?Sala=C3=BCn?= <mic@digikod.net>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-CC: landlock@lists.linux.dev, Debian Kernel Team <debian-kernel@lists.debian.org>
X-Loop: owner@bugs.debian.org
Resent-Date: Fri, 12 Nov 2021 11:33:02 +0000
Resent-Message-ID: <handler.999551.B.16367166188176@bugs.debian.org>
X-Debian-PR-Message: report 999551
X-Debian-PR-Package: src:linux
X-Debian-PR-Keywords: patch
X-Debian-PR-Source: linux
Received: via spool by submit@bugs.debian.org id=B.16367166188176
          (code B); Fri, 12 Nov 2021 11:33:02 +0000
Received: (at submit) by bugs.debian.org; 12 Nov 2021 11:30:18 +0000
X-Spam-Checker-Version: SpamAssassin 3.4.2-bugs.debian.org_2005_01_02
	(2018-09-13) on buxtehude.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=4.0 tests=BAYES_00,HAS_PACKAGE,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,TXREP autolearn=ham autolearn_force=no
	version=3.4.2-bugs.debian.org_2005_01_02
X-Spam-Bayes: score:0.0000 Tokens: new, 53; hammy, 119; neutral, 32; spammy,
	0. spammytokens: hammytokens:0.000-+--X-Debbugs-Cc,
	0.000-+--XDebbugsCc, 0.000-+--exp1, 0.000-+--sk:config_,
	0.000-+--sk:CONFIG_
Received: from smtp-42af.mail.infomaniak.ch ([84.16.66.175]:59693)
	by buxtehude.debian.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mic@digikod.net>)
	id 1mlUl8-00027U-BB
	for submit@bugs.debian.org; Fri, 12 Nov 2021 11:30:18 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4HrGRQ2nn1zMqHjH;
	Fri, 12 Nov 2021 12:23:14 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4HrGRP6mWDzlhKSD;
	Fri, 12 Nov 2021 12:23:13 +0100 (CET)
From: =?UTF-8?Q?Micka=C3=ABl_?= =?UTF-8?Q?Sala=C3=BCn?= <mic@digikod.net>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Cc: landlock@lists.linux.dev, Yves-Alexis Perez <corsac@debian.org>
Message-ID: <5fe178a1-19d5-90b5-c111-57b095848f57@digikod.net>
Date: Fri, 12 Nov 2021 12:23:13 +0100
User-Agent:
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------4B4F29CC3627762290791BFE"
Content-Language: en-US
X-Greylist: delayed 414 seconds by postgrey-1.36 at buxtehude; Fri, 12 Nov 2021 11:30:17 UTC

This is a multi-part message in MIME format.
--------------4B4F29CC3627762290791BFE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Package: src:linux
Version: 5.14.16-1
Severity: normal
Tags: patch
X-Debbugs-Cc: landlock@lists.linux.dev

Hi,

The Landlock security feature is built in Debian kernel since
5.13.12-1~exp1 which is great!  However, it is not enough to enable the
CONFIG_SECURITY_LANDLOCK option as described in the related help.  The
CONFIG_LSM option needs to be prepended by "landlock," to make Landlock
system calls available without modifying the kernel boot arguments.

Could you please apply the attached patch to make this feature more
broadly available?

This can be validated with the tests provided by the kernel sources:

fakeroot make -C tools/testing/selftests TARGETS=landlock gen_tar
tar -xf
tools/testing/selftests/kselftest_install/kselftest-packages/kselftest.tar.gz
# as root:
./run_kselftest.sh

If Yama is enabled, half of the ptrace tests may failed, which is OK.

Regards,
 Mickaël

--------------4B4F29CC3627762290791BFE
Content-Type: text/plain; charset=UTF-8;
 name="config-5.14.0-4-amd64-with-landlock.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="config-5.14.0-4-amd64-with-landlock.patch"

LS0tIGEvY29uZmlnLTUuMTQuMC00LWFtZDY0CisrKyBiL2NvbmZpZy01LjE0LjAtNC1hbWQ2
NApAQCAtOTI3NSw3ICs5Mjc1LDcgQEAgQ09ORklHX0VWTV9BVFRSX0ZTVVVJRD15CiAjIENP
TkZJR19ERUZBVUxUX1NFQ1VSSVRZX1RPTU9ZTyBpcyBub3Qgc2V0CiBDT05GSUdfREVGQVVM
VF9TRUNVUklUWV9BUFBBUk1PUj15CiAjIENPTkZJR19ERUZBVUxUX1NFQ1VSSVRZX0RBQyBp
cyBub3Qgc2V0Ci1DT05GSUdfTFNNPSJsb2NrZG93bix5YW1hLGxvYWRwaW4sc2FmZXNldGlk
LGludGVncml0eSxhcHBhcm1vcixzZWxpbnV4LHNtYWNrLHRvbW95byIKK0NPTkZJR19MU009
ImxhbmRsb2NrLGxvY2tkb3duLHlhbWEsbG9hZHBpbixzYWZlc2V0aWQsaW50ZWdyaXR5LGFw
cGFybW9yLHNlbGludXgsc21hY2ssdG9tb3lvIgogCiAjCiAjIEtlcm5lbCBoYXJkZW5pbmcg
b3B0aW9ucwoK
--------------4B4F29CC3627762290791BFE--
