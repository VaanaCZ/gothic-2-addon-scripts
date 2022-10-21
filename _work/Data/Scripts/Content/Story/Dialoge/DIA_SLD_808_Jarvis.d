// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************
instance DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_Hello_Info()
{	
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //Hej! Nezn�m t� odn�kud?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //To je mo�n�. Taky jsem byl v kolonii.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //Spr�vn�... co chce�?
};
	
// ************************************************************
// 			  					DieLage 
// ************************************************************
instance DIA_Jarvis_DieLage (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_DieLage_Condition;
	information	= DIA_Jarvis_DieLage_Info;
	permanent	= FALSE;
	description = "Jak se vede?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //Jak to vypad�?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Pr�v� te� m�me skute�n� probl�m. Mezi �old�ky se vytv��� dv� frakce.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Sylvio a jeho lid� pochybuj�, �e Lee se dr�� spr�vn�ho z�m�ru.
};
	
// ************************************************************
// 			  					TwoFronts 
// ************************************************************
instance DIA_Jarvis_TwoFronts (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_TwoFronts_Condition;
	information	= DIA_Jarvis_TwoFronts_Info;
	permanent	= FALSE;
	description = "Jak to, �e jsou tu dv� frakce?";
};                       

FUNC INT DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_TwoFronts_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //Jak to, �e jsou tu dv� frakce?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //V�t�ina z n�s se vr�tila z kolonie s Leem.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //Ale n�kte�� ze �old�k� se k n�m p�ipojili pozd�ji.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //Nep�i�li z kolonie, ale bojovali daleko na jihu se sk�ety.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //N�jak se dozv�d�li, �e Lee pot�eboval lidi. Jejich v�dcem byl Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //On souhlasil s t�m, �e Lee z�stane velitelem, ale te� se sna�� po�tvat ostatn� �old�ky proti n�mu a jeho z�m�r�m.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //Hodn� Leeov�ch lid� si nemysl�, �e je to velkej probl�m. Ale j� ty t�pky, jako je Sylvio, zn�m.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //Aby dos�hl sv�ho, bude to klidn� hn�t na ost�� no�e.
};
	
// ************************************************************
// 			  					LeesPlan 
// ************************************************************
instance DIA_Jarvis_LeesPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_LeesPlan_Condition;
	information	= DIA_Jarvis_LeesPlan_Info;
	permanent	= FALSE;
	description = "V�, jak� jsou Leeovy z�m�ry?";
};                       

FUNC INT DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_LeesPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //V�, co chce Lee d�lat?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Lee chce, abychom po�kali a nechali paladiny ve m�st� vyhladov�t.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //Chce n�s v�echny dostat z ostrova. A Innos v�, �e nem�m nic proti tomu odsud vypadnout.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //Skute�n� nev�m, co p�esn� m� za lubem, ale j� mu v���m. Vedl n�s dote�ka dob�e.
};

// ************************************************************
// 			  				SylviosPlan 
// ************************************************************
instance DIA_Jarvis_SylviosPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_SylviosPlan_Condition;
	information	= DIA_Jarvis_SylviosPlan_Info;
	permanent	= FALSE;
	description = "V�, co m� Sylvio v pl�nu?";
};                       

FUNC INT DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //V�, co m� Sylvio v pl�nu?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Sylvio zjistil, �e n�kte�� z paladin� se p�esunuli do star� kolonie.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //��k�, �e zbytek paladin� by se n�s tady neodv�il napadnout, a chce z toho vyt�it co nejv�c.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Drancov�n� mal�ch farem, p�epad�v�n� vojensk�ch hl�dek mimo m�sta, olupov�n� poutn�k�, prost� takov�hle v�ci.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //Ale Lee si mysl�, �e by to byla ta nejhor�� v�c, jakou bychom v na�� situaci mohli ud�lat.
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 6;
	condition	= DIA_Jarvis_WannaJoin_Condition;
	information	= DIA_Jarvis_WannaJoin_Info;
	permanent	= FALSE;
	description = "Cht�l bych se st�t �old�kem!";
};                       

FUNC INT DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //Cht�l bych se st�t �old�kem!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //Nejsem si jistej, �e je to dobrej n�pad.
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //Kde je probl�m?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //No, bu� budu hlasovat pro, nebo proti.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //A v situaci, ve kter� jsme, bych pro tebe ur�it� hlasoval, kdybych si byl jistej, �e jsi na Leeho stran�!
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 7;
	condition	= DIA_Jarvis_MissionKO_Condition;
	information	= DIA_Jarvis_MissionKO_Info;
	permanent	= FALSE;
	description = "Tak�e co bych m�l d�lat?";
};                       

FUNC INT DIA_Jarvis_MissionKO_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo (other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_MissionKO_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //Tak�e co bych m�l d�lat?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //To je jednoduch�. Zmla� p�r Sylviov�ch hoch�! T�mhle zp�sobem budou ob� strany p�esn� v�d�t, kde stoj�.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //A pokud se bude� p�i souboji dr�et pravidel, dokonce z�sk� respekt ostatn�ch.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis mi d� sv�j hlas, pokud se mi poda�� porazit Sylviovy hochy.");
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_DuellRegeln_Condition;
	information	= DIA_Jarvis_DuellRegeln_Info;
	permanent	= FALSE;
	description = "Jak� jsou pravidla pro souboj?";
};                       

FUNC INT DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_DuellRegeln_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //Jak� jsou pravidla pro souboj?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //B� za Torlofem a nech si to vysv�tlit, pokud t� to zaj�m�.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //Tak�e u� si rozum�me: Nezaj�m� m�, jestli dodr�uje� pravidla nebo ne. Prost� a� ti chlapi le�� dr�kou v bahn�!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"A j� se ��dn�mi soubojov�mi pravidly ��dit nemus�m...");
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_SylviosMen_Condition;
	information	= DIA_Jarvis_SylviosMen_Info;
	permanent	= FALSE;
	description = "Kte�� z �old�k� jsou Sylviovi mu�i?";
};                       

FUNC INT DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosMen_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //Kte�� ze �old�k� jsou Sylviovi mu�i?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //Je to �est chlap�. Prvn� je Sylvio s�m a jeho prav� ruka Bullco.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //A pak jsou tu Rod, Sentenza, Fester a Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //Zbytek chlap� je bu� neutr�ln�ch, nebo na Leeov� stran�.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"K Sylviov�m chlap�m pat�� jeho velitel Bullco, Rod, Sentenza, Fester a Raoul.");
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowMany_Condition;
	information	= DIA_Jarvis_HowMany_Info;
	permanent	= FALSE;
	description = "Kolik Sylviov�ch lid� bych m�l p�emoci?";
};                       

FUNC INT DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowMany_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //Kolik Sylviov�ch chlap� m�m porazit?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //Pokud sraz� t�i z nich k zemi, pak n�m dok�e�, na kter� jsi stran�.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //Koho z nich si vybere�, to je tvoje v�c.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //Alespo� jedna mal� rada: Tohle nen� o tom dok�zat si kur�. Necho� p��mo proti Sylviovi samotn�mu - nad�lal by z tebe sekanou.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Posta��, kdy� poraz�m t�i Sylviovy kump�ny - se Sylviem samotn�m bych se do k��ku rad�i pou�t�t nem�l.");
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowManyLeft_Condition;
	information	= DIA_Jarvis_HowManyLeft_Info;
	permanent	= TRUE;
	description = "Kolik Sylviov�ch mu�� je je�t� st�le na m�m seznamu?";
};                       

FUNC INT DIA_Jarvis_HowManyLeft_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowManyLeft_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //Kolik Sylviov�ch mu�� m�m je�t� na seznamu?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //Porazil jsem Bullca.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //Sly�el jsem. To nebylo zl�.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Rod vypad� trochu unaven�.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza se pokusil ze m� dostat n�jakou zlatku - to nebylo chytr�.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //Sundal jsem Sentenzu.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester se m� pokusil oblafnout - to byla velk� chyba.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester dostal, co si zaslou�il.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //A to sam� Raoul...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //Byl jsem se na Raoula pod�vat...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //A?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //Pot�eboval po��dnou nakl�da�ku.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //Dote� jsi neslo�il jedin�ho Sylviova chlapa.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Dob�e - jen pokra�uj.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //O�ek�v�m od tebe, �e z��d� alespo� t�i z nich.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //To sta��, to sta��.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //Ty jsi skute�n� napr�skal ka�d�mu z nich, jo?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //Ud�lal jsi na m� dojem - a� se m� Lee zept�, budu bez v�h�n� hlasovat pro tebe.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Kdy� se budu cht�t p�ipojit k �old�k�m, Jarvis bude pro.");
	};
};


// ###############################
// ##							##
// 			H�here Gilden
// ##							##
// ###############################


// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= FALSE;
	description = "Co je nov�ho?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //Co je nov�ho?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //Te� jsi jeden z n�s. To je dob�e.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //Vybral sis �patn�, mohl ses st�t jedn�m z n�s.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //Posledn� dobou Sylviovi lid� dost zkrotli. (divok� sm�ch)
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Sylvio je kone�n� pry�. Po tom, co se doslechl o drac�ch, se on a p�r jeho chlap� vydali do t�a�sk� kolonie.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //Pravd�podobn� si mysl�, �e by tam mohlo b�t n�co v�c.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Nic, te� u� je v�echno v klidu. Nem��u se do�kat toho, a� uvid�m, jak tohle v�echno dopadne.
		};
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jarvis_PICKPOCKET (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 900;
	condition	= DIA_Jarvis_PICKPOCKET_Condition;
	information	= DIA_Jarvis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen (41, 55);
};
 
FUNC VOID DIA_Jarvis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_BACK 		,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};
	
func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};





		





