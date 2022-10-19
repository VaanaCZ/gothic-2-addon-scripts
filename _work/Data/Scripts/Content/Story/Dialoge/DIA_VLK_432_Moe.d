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
	AI_Output (self ,other,"DIA_Moe_Hallo_01_00"); //Hej ty, tebe nezn�m. Co tady chce�? M� nam��eno do hospody?
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Ne, nem�m nam��eno do hospody... (KONEC)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Aha, tak�e tohle je m�stn� n�levna.",DIA_Moe_Hallo_Witz);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Jo, vad� ti to?",DIA_Moe_Hallo_Reizen);
};
FUNC VOID DIA_Moe_Hallo_Gehen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Gehen_15_00"); //Ne, nem�m nam��eno do hospody.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_01"); //Jo, to bych �ekl. To je ale fuk - pr�v� proto m��eme j�t p��mo k v�ci.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_02"); //Kdy� u� jsi tady, n�co ti nab�dnu. Dej mi 50 zla��k� a m��e� j�t d�l.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_03"); //To je vstupn� do hospody.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Uvid�me, jestli si to sam� mysl� i domobrana...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice    (DIA_Moe_Hallo,"Na to zapome�, nedostane� ani m���k!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"Dobr�. Zaplat�m.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice    (DIA_Moe_Hallo,"Ale j� nechci j�t do hospody!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Kneipe()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Kneipe_15_00"); //Ale j� do hospody v�bec nechci j�t!
	AI_Output (self ,other,"DIA_Moe_Hallo_Kneipe_01_01"); //V�, d��v nebo pozd�ji chce do hospody ka�d�. Tak�e kdy� mi zaplat� hned, bude� to m�t pro p��t� z krku.
};
FUNC VOID  DIA_Moe_Hallo_Witz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Witz_15_00"); //Ah�, tohle je p��stavn� n�levna? A j� si myslel, �e je to pal�c m�stodr��c�ho!
	AI_Output (self ,other,"DIA_Moe_Hallo_Witz_01_01"); //Hele, nech si ty hloup� f�rky, skr�ku, nebo bude� brzo �vejkat dla�ebn� kostky.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Ch�pu, budu ti muset d�t p�r p�es dr�ku.",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Ty m� chce� dostat do mal�ru, co?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Uklidni se, chci si d�t jenom jedno pivo.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice    (DIA_Moe_Hallo,"Ale j� nechci j�t do hospody!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Reizen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Reizen_15_00"); //Jo, vad� ti to?
	AI_Output (self ,other,"DIA_Moe_Hallo_Reizen_01_01"); //Tady nem� co pohled�vat, skr�ku.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Ch�pu, budu ti muset d�t p�r p�es dr�ku.",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Ty m� chce� dostat do mal�ru, co?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Uklidni se, chci si d�t jenom jedno pivo.",DIA_Moe_Hallo_Ruhig);
};
FUNC VOID DIA_Moe_Hallo_Miliz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Miliz_15_00"); //Uvid�me, jestli si to sam� mysl� i domobrana.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_01"); //(sm�je se) Nikdo z domobrany tady nen�. A v� pro�?
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_02"); //Proto�e tady jsi v p��stavn� �tvrti, skr�ku. Nikdo z domobrany se tu se mnou rv�t nebude.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_03"); //V�t�inou jsou v�ichni nalezl� u '�erven� lucerny'. Tak vid� - jsme tu jen my dva. (zl� ��klebek)
};
FUNC VOID DIA_Moe_Hallo_Pruegel()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Pruegel_15_00"); //Ch�pu. Ne� p�jdu d�l, budu t� muset st�hnout z k��e.
	AI_Output (self ,other,"DIA_Moe_Hallo_Pruegel_01_01"); //Jen si to zkus, skr�ku. Uka�, co um�!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Aerger()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Aerger_15_00"); //Ty m� chce� dostat do mal�ru, co?
	AI_Output (self ,other,"DIA_Moe_Hallo_Aerger_01_01"); //Jo, v tom, jak dostat n�koho do mal�ru, jsem mistr. Tak�e se koukej br�nit, skr�ku!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Ruhig()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Ruhig_15_00"); //Uklidni se, chci si d�t jenom jedno pivo.
	AI_Output (self ,other,"DIA_Moe_Hallo_Ruhig_01_01"); //Fajn, ale vstupn� t� bude st�t 50 zla��k�. (�kleb� se)
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Na to zapome�, nedostane� ani m���k!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"Dobr�. Zaplat�m.",DIA_Moe_Hallo_Zahlen);
	
};
FUNC VOID DIA_Moe_Hallo_Zahlen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_00"); //No tak j� ti teda zaplat�m.
	
	if B_GiveInvItems (other, self, ItMi_Gold,50)
	{
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_01"); //V�born�. A kdy� jsme to tak hezky vy�e�ili, m��e� mi d�t i to ostatn�, co m� u sebe.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Na to zapome�, nedostane� ani m���k!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"OK, tohle je v�echno, co m�m.",DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems (hero, ItMi_Gold) > 9)
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_02"); //...ale j� u sebe nem�m tolik zla��k�.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_03"); //To nevad�, tak prost� naval v�echno, co m� u sebe.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Na to zapome�, nedostane� ani m���k!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"OK, tohle je v�echno, co m�m.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_04"); //...ale j� nem�m ani 10 zla��k�.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_05"); //Chlape, j� nem�m ani vindru.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_06"); //No dob�e - povzdech - m��e� j�t.
		
		AI_StopProcessInfos (self);
	};

};
FUNC VOID DIA_Moe_Hallo_Vergisses()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Vergisses_15_00"); //Na to zapome�, nedostane� ani m���k!
	AI_Output (self ,other,"DIA_Moe_Hallo_Vergisses_01_01"); //Pak si vezmu v�echno, co m� - jen co mi bude� le�et u nohou.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Alles()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Alles_15_00"); //Fajn, tohle je v�echno, co m�m.
	
	B_GiveInvItems (other, self, ItMi_Gold, Npc_HasItems (other,ItMi_Gold));
	
	AI_Output (self ,other,"DIA_Moe_Hallo_Alles_01_01"); //Dobr�, to mi teda sta��. To jsem cel� j� - v�dycky velkorys�. (�kleb� se)
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
	description = "Ty se tady v p��stavu dost vyzn�, vi�?";
};                       

FUNC INT DIA_Moe_Harbor_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_Moe_Harbor_Info()
{	
	AI_Output (other,self ,"DIA_Moe_Harbor_15_00"); //Ty se tady v p��stavu dost vyzn�, vi�?
	AI_Output (self ,other,"DIA_Moe_Harbor_01_01"); //Jasn� v�c. Pro�?
	
	Info_ClearChoices (DIA_Moe_Harbor);
	Info_AddChoice		(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice		(DIA_Moe_Harbor,"Jak� lod� sem p�iplouvaj�?",DIA_Moe_Harbor_Ship);
	Info_AddChoice		(DIA_Moe_Harbor,"Jak to, �e tu nevid�m nikoho z domobrany?",DIA_Moe_Harbor_Militia);
	Info_AddChoice 		(DIA_Moe_Harbor,"O �em se tu asi tak nejv�c pov�d�?",DIA_Moe_Harbor_Rumors);
};

FUNC VOID DIA_Moe_Harbor_Back ()
{
	Info_ClearChoices (DIA_Moe_Harbor);
};

FUNC VOID DIA_Moe_Harbor_Ship ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Ship_15_00"); //Jak �asto sem p�iplouvaj� nov� lod�?
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_01"); //Jedin� lo�, kter� sem v posledn� dob� p�iplula, je ta paladinsk� galeona.
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_02"); //Najde� ji tamhle za t�m �tesem na jihoz�pad�.
	
};

FUNC VOID DIA_Moe_Harbor_Militia ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Militia_15_00"); //Jak je mo�n�, �e tu nevid�m nikoho z domobrany?
	AI_Output (self ,other,"DIA_Moe_Harbor_Militia_01_01"); //Netroufaj� si sem chodit - v�dycky si v�echno vy��d�me sami.
};

FUNC VOID DIA_Moe_Harbor_Rumors ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_00"); //O �em se tu asi tak nejv�c pov�d�?
	
	if (Kapitel == 1)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_01"); //Nem�me r�di lidi, kte�� se moc vypt�vaj�. Zvl�� kdy� jsou to cizinci.
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_02"); //Coby - nic. V�echno je tu v klidu a pohod�.
		}
		else if (hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_03"); //(nep�irozen�) Je to �patn�. �asy jsou zl�, ale v�ichni se sna��me z�stat �estn� a poctiv�.
			AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_04"); //Ned�lej si ze m� �oufky.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_05"); //Jak si o mn� m��e� n�co takov�ho myslet? Te� ses m� teda hluboce dotkl.
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_06"); //Je tu fakt horko. Lord Andre se u� n�jakou dobu sna�� strkat nos do v�c�, po kter�ch mu pranic nen�.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_07"); //Ti nafoukanci nikdy nepochop�, jak to tady dole chod�.
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
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_08"); //My s t�m nem�me nic spole�n�ho.
				AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_09"); //S ��m?
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_10"); //S t�m paladinem, kter�ho tu zabili. Opravdu by ses o ty �old�ky nem�l starat - jenom t�m ma�� �as.
			}
			else
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_11"); //V�m, �e s t�m nem� nic spole�n�ho, ale ta vra�da paladina v�echny urozen� d�entlmeny po��dn� vylekala.
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_12"); //Jestli ti m��u d�t p��telskou radu, tak zmiz z m�sta. Aspo� na chv�li.
			};	
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_13"); //Kdy� vy�lo najevo, �e �old�ci s t�m paladinem nem�li nic spole�n�ho, domobrana si sem u� netrouf� ani vkro�it.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_14"); //Mysl�m, �e se boj�, aby jim nikdo nerozbil dr�ku. Mn� osobn� by to v�bec nevadilo.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_15"); //Ned�je se tu absolutn� nic.
	}
	else //Kapitel 5
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_16"); //Kone�n� ti nabub�el� paladinov� vypadli z p��stavu. Bylo na�ase.
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
	AI_Output (self, other, "DIA_Moe_LEHMARGELDEINTREIBEN_01_00"); //Hej, ty tam! Lehmar t� zdrav�.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};







