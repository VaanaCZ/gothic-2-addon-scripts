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
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //Hej! Nezn·m tÏ odnÏkud?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //To je moûn˝. Taky jsem byl v kolonii.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //Spr·vnÏ... co chceö?
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
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //Jak to vypad·?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Pr·vÏ teÔ m·me skuteËn˝ problÈm. Mezi ûold·ky se vytv·¯Ì dvÏ frakce.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Sylvio a jeho lidÈ pochybujÌ, ûe Lee se drûÌ spr·vnÈho z·mÏru.
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
	description = "Jak to, ûe jsou tu dvÏ frakce?";
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
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //Jak to, ûe jsou tu dvÏ frakce?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //VÏtöina z n·s se vr·tila z kolonie s Leem.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //Ale nÏkte¯Ì ze ûold·k˘ se k n·m p¯ipojili pozdÏji.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //Nep¯iöli z kolonie, ale bojovali daleko na jihu se sk¯ety.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //NÏjak se dozvÏdÏli, ûe Lee pot¯eboval lidi. Jejich v˘dcem byl Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //On souhlasil s tÌm, ûe Lee z˘stane velitelem, ale teÔ se snaûÌ poötvat ostatnÌ ûold·ky proti nÏmu a jeho z·mÏr˘m.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //HodnÏ Leeov˝ch lidÌ si nemyslÌ, ûe je to velkej problÈm. Ale j· ty t˝pky, jako je Sylvio, zn·m.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //Aby dos·hl svÈho, bude to klidnÏ hn·t na ost¯Ì noûe.
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
	description = "VÌö, jakÈ jsou Leeovy z·mÏry?";
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
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //VÌö, co chce Lee dÏlat?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Lee chce, abychom poËkali a nechali paladiny ve mÏstÏ vyhladovÏt.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //Chce n·s vöechny dostat z ostrova. A Innos vÌ, ûe nem·m nic proti tomu odsud vypadnout.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //SkuteËnÏ nevÌm, co p¯esnÏ m· za lubem, ale j· mu vÏ¯Ìm. Vedl n·s doteÔka dob¯e.
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
	description = "VÌö, co m· Sylvio v pl·nu?";
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
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //VÌö, co m· Sylvio v pl·nu?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Sylvio zjistil, ûe nÏkte¯Ì z paladin˘ se p¯esunuli do starÈ kolonie.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //ÿÌk·, ûe zbytek paladin˘ by se n·s tady neodv·ûil napadnout, a chce z toho vytÏûit co nejvÌc.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Drancov·nÌ mal˝ch farem, p¯epad·v·nÌ vojensk˝ch hlÌdek mimo mÏsta, olupov·nÌ poutnÌk˘, prostÏ takovÈhle vÏci.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //Ale Lee si myslÌ, ûe by to byla ta nejhoröÌ vÏc, jakou bychom v naöÌ situaci mohli udÏlat.
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
	description = "ChtÏl bych se st·t ûold·kem!";
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
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //ChtÏl bych se st·t ûold·kem!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //Nejsem si jistej, ûe je to dobrej n·pad.
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //Kde je problÈm?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //No, buÔ budu hlasovat pro, nebo proti.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //A v situaci, ve kterÈ jsme, bych pro tebe urËitÏ hlasoval, kdybych si byl jistej, ûe jsi na Leeho stranÏ!
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
	description = "Takûe co bych mÏl dÏlat?";
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
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //Takûe co bych mÏl dÏlat?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //To je jednoduchÈ. Zmlaù p·r Sylviov˝ch hoch˘! TÌmhle zp˘sobem budou obÏ strany p¯esnÏ vÏdÏt, kde stojÌö.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //A pokud se budeö p¯i souboji drûet pravidel, dokonce zÌsk·ö respekt ostatnÌch.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis mi d· sv˘j hlas, pokud se mi poda¯Ì porazit Sylviovy hochy.");
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
	description = "Jak· jsou pravidla pro souboj?";
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
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //Jak· jsou pravidla pro souboj?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //BÏû za Torlofem a nech si to vysvÏtlit, pokud tÏ to zajÌm·.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //Takûe uû si rozumÌme: NezajÌm· mÏ, jestli dodrûujeö pravidla nebo ne. ProstÏ aù ti chlapi leûÌ drûkou v bahnÏ!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"A j· se û·dn˝mi soubojov˝mi pravidly ¯Ìdit nemusÌm...");
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
	description = "Kte¯Ì z ûold·k˘ jsou Sylviovi muûi?";
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
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //Kte¯Ì ze ûold·k˘ jsou Sylviovi muûi?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //Je to öest chlap˘. PrvnÌ je Sylvio s·m a jeho prav· ruka Bullco.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //A pak jsou tu Rod, Sentenza, Fester a Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //Zbytek chlap˘ je buÔ neutr·lnÌch, nebo na LeeovÏ stranÏ.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"K Sylviov˝m chlap˘m pat¯Ì jeho velitel Bullco, Rod, Sentenza, Fester a Raoul.");
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
	description = "Kolik Sylviov˝ch lidÌ bych mÏl p¯emoci?";
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
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //Kolik Sylviov˝ch chlap˘ m·m porazit?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //Pokud srazÌö t¯i z nich k zemi, pak n·m dok·ûeö, na kterÈ jsi stranÏ.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //Koho z nich si vybereö, to je tvoje vÏc.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //AlespoÚ jedna mal· rada: Tohle nenÌ o tom dok·zat si kur·û. NechoÔ p¯Ìmo proti Sylviovi samotnÈmu - nadÏlal by z tebe sekanou.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"PostaËÌ, kdyû porazÌm t¯i Sylviovy kump·ny - se Sylviem samotn˝m bych se do k¯Ìûku radöi pouötÏt nemÏl.");
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
	description = "Kolik Sylviov˝ch muû˘ je jeötÏ st·le na mÈm seznamu?";
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
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //Kolik Sylviov˝ch muû˘ m·m jeötÏ na seznamu?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //Porazil jsem Bullca.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //Slyöel jsem. To nebylo zl˝.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Rod vypad· trochu unavenÏ.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza se pokusil ze mÏ dostat nÏjakou zlatku - to nebylo chytr˝.
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
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester se mÏ pokusil oblafnout - to byla velk· chyba.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester dostal, co si zaslouûil.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //A to samÈ Raoul...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //Byl jsem se na Raoula podÌvat...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //A?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //Pot¯eboval po¯·dnou nakl·daËku.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //DoteÔ jsi nesloûil jedin˝ho Sylviova chlapa.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Dob¯e - jen pokraËuj.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //OËek·v·m od tebe, ûe z¯ÌdÌö alespoÚ t¯i z nich.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //To staËÌ, to staËÌ.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //Ty jsi skuteËnÏ napr·skal kaûd˝mu z nich, jo?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //UdÏlal jsi na mÏ dojem - aû se mÏ Lee zept·, budu bez v·h·nÌ hlasovat pro tebe.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Kdyû se budu chtÌt p¯ipojit k ûold·k˘m, Jarvis bude pro.");
	};
};


// ###############################
// ##							##
// 			Hˆhere Gilden
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
	description = "Co je novÈho?";
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
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //Co je novÈho?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //TeÔ jsi jeden z n·s. To je dob¯e.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //Vybral sis öpatnÏ, mohl ses st·t jednÌm z n·s.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //PoslednÌ dobou Sylviovi lidÈ dost zkrotli. (divok˝ smÌch)
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Sylvio je koneËnÏ pryË. Po tom, co se doslechl o dracÌch, se on a p·r jeho chlap˘ vydali do tÏûa¯skÈ kolonie.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //PravdÏpodobnÏ si myslÌ, ûe by tam mohlo b˝t nÏco vÌc.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Nic, teÔ uû je vöechno v klidu. Nem˘ûu se doËkat toho, aû uvidÌm, jak tohle vöechno dopadne.
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





		





