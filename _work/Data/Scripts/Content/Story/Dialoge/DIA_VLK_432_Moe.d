///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Moe_EXIT   (C_INFO)
{
	npc         = VLK_432_Moe;
	nr          = 999;
	condition   = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Moe_PICKPOCKET (C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 900;
	condition	= DIA_Moe_PICKPOCKET_Condition;
	information	= DIA_Moe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Moe_PICKPOCKET_Condition()
{
	C_Beklauen (25, 30);
};
 
FUNC VOID DIA_Moe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Moe_PICKPOCKET);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_BACK 		,DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
	
func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
// ************************************************************
// 			     Hallo
// ************************************************************
INSTANCE DIA_Moe_Hallo(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 2;
	condition	= DIA_Moe_Hallo_Condition;
	information	= DIA_Moe_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       

FUNC INT DIA_Moe_Hallo_Condition()
{	
	if (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_NOV)
	&& (Npc_RefuseTalk(self) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Moe_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Moe_Hallo_01_00"); //Hej ty, tebe nezn·m. Co tady chceö? M·ö namÌ¯eno do hospody?
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Ne, nem·m namÌ¯eno do hospody... (KONEC)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Aha, takûe tohle je mÌstnÌ n·levna.",DIA_Moe_Hallo_Witz);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Jo, vadÌ ti to?",DIA_Moe_Hallo_Reizen);
};
FUNC VOID DIA_Moe_Hallo_Gehen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Gehen_15_00"); //Ne, nem·m namÌ¯eno do hospody.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_01"); //Jo, to bych ¯ekl. To je ale fuk - pr·vÏ proto m˘ûeme jÌt p¯Ìmo k vÏci.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_02"); //Kdyû uû jsi tady, nÏco ti nabÌdnu. Dej mi 50 zlaù·k˘ a m˘ûeö jÌt d·l.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_03"); //To je vstupnÈ do hospody.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"UvidÌme, jestli si to samÈ myslÌ i domobrana...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice    (DIA_Moe_Hallo,"Na to zapomeÚ, nedostaneö ani mÏÔ·k!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"Dobr·. ZaplatÌm.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice    (DIA_Moe_Hallo,"Ale j· nechci jÌt do hospody!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Kneipe()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Kneipe_15_00"); //Ale j· do hospody v˘bec nechci jÌt!
	AI_Output (self ,other,"DIA_Moe_Hallo_Kneipe_01_01"); //VÌö, d¯Ìv nebo pozdÏji chce do hospody kaûd˝. Takûe kdyû mi zaplatÌö hned, budeö to mÌt pro p¯ÌötÏ z krku.
};
FUNC VOID  DIA_Moe_Hallo_Witz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Witz_15_00"); //Ah·, tohle je p¯ÌstavnÌ n·levna? A j· si myslel, ûe je to pal·c mÌstodrûÌcÌho!
	AI_Output (self ,other,"DIA_Moe_Hallo_Witz_01_01"); //Hele, nech si ty hloup˝ fÛrky, skrËku, nebo budeö brzo ûvejkat dlaûebnÌ kostky.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Ch·pu, budu ti muset d·t p·r p¯es drûku.",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Ty mÏ chceö dostat do malÈru, co?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Uklidni se, chci si d·t jenom jedno pivo.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice    (DIA_Moe_Hallo,"Ale j· nechci jÌt do hospody!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Reizen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Reizen_15_00"); //Jo, vadÌ ti to?
	AI_Output (self ,other,"DIA_Moe_Hallo_Reizen_01_01"); //Tady nem·ö co pohled·vat, skrËku.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Ch·pu, budu ti muset d·t p·r p¯es drûku.",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Ty mÏ chceö dostat do malÈru, co?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Uklidni se, chci si d·t jenom jedno pivo.",DIA_Moe_Hallo_Ruhig);
};
FUNC VOID DIA_Moe_Hallo_Miliz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Miliz_15_00"); //UvidÌme, jestli si to samÈ myslÌ i domobrana.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_01"); //(smÏje se) Nikdo z domobrany tady nenÌ. A vÌö proË?
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_02"); //Protoûe tady jsi v p¯ÌstavnÌ Ëtvrti, skrËku. Nikdo z domobrany se tu se mnou rv·t nebude.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_03"); //VÏtöinou jsou vöichni nalezlÌ u '»ervenÈ lucerny'. Tak vidÌö - jsme tu jen my dva. (zl˝ ˙öklebek)
};
FUNC VOID DIA_Moe_Hallo_Pruegel()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Pruegel_15_00"); //Ch·pu. Neû p˘jdu d·l, budu tÏ muset st·hnout z k˘ûe.
	AI_Output (self ,other,"DIA_Moe_Hallo_Pruegel_01_01"); //Jen si to zkus, skrËku. Ukaû, co umÌö!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Aerger()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Aerger_15_00"); //Ty mÏ chceö dostat do malÈru, co?
	AI_Output (self ,other,"DIA_Moe_Hallo_Aerger_01_01"); //Jo, v tom, jak dostat nÏkoho do malÈru, jsem mistr. Takûe se koukej br·nit, skrËku!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Ruhig()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Ruhig_15_00"); //Uklidni se, chci si d·t jenom jedno pivo.
	AI_Output (self ,other,"DIA_Moe_Hallo_Ruhig_01_01"); //Fajn, ale vstupnÈ tÏ bude st·t 50 zlaù·k˘. (öklebÌ se)
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Na to zapomeÚ, nedostaneö ani mÏÔ·k!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"Dobr·. ZaplatÌm.",DIA_Moe_Hallo_Zahlen);
	
};
FUNC VOID DIA_Moe_Hallo_Zahlen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_00"); //No tak j· ti teda zaplatÌm.
	
	if B_GiveInvItems (other, self, ItMi_Gold,50)
	{
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_01"); //V˝bornÏ. A kdyû jsme to tak hezky vy¯eöili, m˘ûeö mi d·t i to ostatnÌ, co m·ö u sebe.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Na to zapomeÚ, nedostaneö ani mÏÔ·k!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"OK, tohle je vöechno, co m·m.",DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems (hero, ItMi_Gold) > 9)
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_02"); //...ale j· u sebe nem·m tolik zlaù·k˘.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_03"); //To nevadÌ, tak prostÏ naval vöechno, co m·ö u sebe.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Na to zapomeÚ, nedostaneö ani mÏÔ·k!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"OK, tohle je vöechno, co m·m.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_04"); //...ale j· nem·m ani 10 zlaù·k˘.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_05"); //Chlape, j· nem·m ani vindru.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_06"); //No dob¯e - povzdech - m˘ûeö jÌt.
		
		AI_StopProcessInfos (self);
	};

};
FUNC VOID DIA_Moe_Hallo_Vergisses()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Vergisses_15_00"); //Na to zapomeÚ, nedostaneö ani mÏÔ·k!
	AI_Output (self ,other,"DIA_Moe_Hallo_Vergisses_01_01"); //Pak si vezmu vöechno, co m·ö - jen co mi budeö leûet u nohou.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Alles()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Alles_15_00"); //Fajn, tohle je vöechno, co m·m.
	
	B_GiveInvItems (other, self, ItMi_Gold, Npc_HasItems (other,ItMi_Gold));
	
	AI_Output (self ,other,"DIA_Moe_Hallo_Alles_01_01"); //Dobr·, to mi teda staËÌ. To jsem cel˝ j· - vûdycky velkorys˝. (öklebÌ se)
	AI_StopProcessInfos (self);
};
//************************************************
//	Das Hafenviertel
//************************************************

INSTANCE DIA_Moe_Harbor(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 998;
	condition	= DIA_Moe_Harbor_Condition;
	information	= DIA_Moe_Harbor_Info;
	permanent	= TRUE;
	description = "Ty se tady v p¯Ìstavu dost vyzn·ö, viÔ?";
};                       

FUNC INT DIA_Moe_Harbor_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_Moe_Harbor_Info()
{	
	AI_Output (other,self ,"DIA_Moe_Harbor_15_00"); //Ty se tady v p¯Ìstavu dost vyzn·ö, viÔ?
	AI_Output (self ,other,"DIA_Moe_Harbor_01_01"); //Jasn· vÏc. ProË?
	
	Info_ClearChoices (DIA_Moe_Harbor);
	Info_AddChoice		(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice		(DIA_Moe_Harbor,"JakÈ lodÏ sem p¯iplouvajÌ?",DIA_Moe_Harbor_Ship);
	Info_AddChoice		(DIA_Moe_Harbor,"Jak to, ûe tu nevidÌm nikoho z domobrany?",DIA_Moe_Harbor_Militia);
	Info_AddChoice 		(DIA_Moe_Harbor,"O Ëem se tu asi tak nejvÌc povÌd·?",DIA_Moe_Harbor_Rumors);
};

FUNC VOID DIA_Moe_Harbor_Back ()
{
	Info_ClearChoices (DIA_Moe_Harbor);
};

FUNC VOID DIA_Moe_Harbor_Ship ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Ship_15_00"); //Jak Ëasto sem p¯iplouvajÌ novÈ lodÏ?
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_01"); //Jedin· loÔ, kter· sem v poslednÌ dobÏ p¯iplula, je ta paladinsk· galeona.
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_02"); //Najdeö ji tamhle za tÌm ˙tesem na jihoz·padÏ.
	
};

FUNC VOID DIA_Moe_Harbor_Militia ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Militia_15_00"); //Jak je moûnÈ, ûe tu nevidÌm nikoho z domobrany?
	AI_Output (self ,other,"DIA_Moe_Harbor_Militia_01_01"); //NetroufajÌ si sem chodit - vûdycky si vöechno vy¯ÌdÌme sami.
};

FUNC VOID DIA_Moe_Harbor_Rumors ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_00"); //O Ëem se tu asi tak nejvÌc povÌd·?
	
	if (Kapitel == 1)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_01"); //Nem·me r·di lidi, kte¯Ì se moc vypt·vajÌ. Zvl·öù kdyû jsou to cizinci.
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_02"); //Coby - nic. Vöechno je tu v klidu a pohodÏ.
		}
		else if (hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_03"); //(nep¯irozenÏ) Je to öpatnÈ. »asy jsou zlÈ, ale vöichni se snaûÌme z˘stat ËestnÌ a poctivÌ.
			AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_04"); //NedÏlej si ze mÏ öoufky.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_05"); //Jak si o mnÏ m˘ûeö nÏco takovÈho myslet? TeÔ ses mÏ teda hluboce dotkl.
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_06"); //Je tu fakt horko. Lord Andre se uû nÏjakou dobu snaûÌ strkat nos do vÏcÌ, po kter˝ch mu pranic nenÌ.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_07"); //Ti nafoukanci nikdy nepochopÌ, jak to tady dole chodÌ.
		};
		
	}
	else if (Kapitel == 3)
	{
		if (Mis_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_08"); //My s tÌm nem·me nic spoleËnÈho.
				AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_09"); //S ËÌm?
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_10"); //S tÌm paladinem, kterÈho tu zabili. Opravdu by ses o ty ûold·ky nemÏl starat - jenom tÌm ma¯Ìö Ëas.
			}
			else
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_11"); //VÌm, ûe s tÌm nem·ö nic spoleËnÈho, ale ta vraûda paladina vöechny urozenÈ dûentlmeny po¯·dnÏ vylekala.
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_12"); //Jestli ti m˘ûu d·t p¯·telskou radu, tak zmiz z mÏsta. AspoÚ na chvÌli.
			};	
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_13"); //Kdyû vyölo najevo, ûe ûold·ci s tÌm paladinem nemÏli nic spoleËnÈho, domobrana si sem uû netrouf· ani vkroËit.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_14"); //MyslÌm, ûe se bojÌ, aby jim nikdo nerozbil drûku. MnÏ osobnÏ by to v˘bec nevadilo.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_15"); //NedÏje se tu absolutnÏ nic.
	}
	else //Kapitel 5
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_16"); //KoneËnÏ ti nabub¯elÌ paladinovÈ vypadli z p¯Ìstavu. Bylo naËase.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LehmarGeldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Moe_LEHMARGELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_432_Moe;
	nr			 =  2;
	condition	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Moe_LEHMARGELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Moe_LEHMARGELDEINTREIBEN_01_00"); //Hej, ty tam! Lehmar tÏ zdravÌ.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};







