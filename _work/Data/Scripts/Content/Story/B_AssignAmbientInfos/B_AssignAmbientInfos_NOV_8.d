// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_8_EXIT_Condition;
	information	= DIA_NOV_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_8_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_8_Fegen_Condition;
	information	= DIA_NOV_8_Fegen_Info;
	permanent	= TRUE;
	description = "Pot�ebuju pomoci zam�st pokoje novic�.";
};                       

FUNC INT DIA_NOV_8_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};
//-------------------------------
var int Feger3_Permanent;
//-------------------------------
FUNC VOID DIA_NOV_8_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Fegen_15_00"); //Pot�ebuju pomoct zam�st pokoje novic�.
	
	if (Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self))
	{	
		if (Feger3_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_01"); //No nazdar. Pr�v� jsi p�i�el a hned ze sebe nech� d�lat ukl�ze�ku?
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_02"); //Uklidni se, se mnou to bylo to sam�, kdy� jsem sem poprv� p�i�el. A proto se ti chyst�m pomoct. Asi by se n�m p�kn� vysm�li, kdybychom to nezvl�dli.
			
			NOV_Helfer = (NOV_Helfer +1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"U� jsem narazil na novice, kter� mi s �klidem komnat pom��e.");
		}
		else //if (Feger3_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_03"); //Brat�e, jsem obezn�men se situac�, do kter� ses dostal. A u� jsem ti �ekl, �e ti pomohu. A to pr�v� d�l�m.
		};
	};
	//-------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------
	
	if ((Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self)) == FALSE )
	{	
		AI_Output (self, other, "DIA_NOV_8_Fegen_08_04"); //Hele, r�d bych, ale fakt nem�m �as.
	};
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_8_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_8_Wurst_Condition;
	information	= DIA_NOV_8_Wurst_Info;
	permanent	= TRUE;
	description = "Co takhle jem�ou�k� skopov� klob�ska?";
};                       

FUNC INT DIA_NOV_8_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Wurst_15_00"); //Co takhle jem�ou�k� skopov� klob�ska?
	AI_Output (self, other, "DIA_NOV_8_Wurst_08_01"); //Tak tomu se ned� ��ct ne. D�ky, chlape, p�esn� to jsem pot�eboval.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_8_JOIN_Condition;
	information	= DIA_NOV_8_JOIN_Info;
	permanent	= TRUE;
	description = "Co mus�m ud�lat, abych se stal m�gem?";
};                       

FUNC INT DIA_NOV_8_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_JOIN_15_00"); //Co mus�m ud�lat, abych se stal m�gem?
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_01"); //Innosov�m vyvolen�m se m��e� st�t pouze v p��pad�, �e k tomu d� svolen� nejvy��� rada.
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_02"); //Jako novicov� m�me zak�z�no studovat runovou magii - a star� posv�tn� spisy m��eme pro��tat jen se svolen�m m�g�.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_8_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_8_PEOPLE_Condition;
	information	= DIA_NOV_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo vede tenhle kl�ter?";
};                       

FUNC INT DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_PEOPLE_15_00"); //Kdo vede tenhle kl�ter?
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_01"); //Nejvy��� rada, kterou tvo�� t�i nejmocn�j�� m�gov�. Ka�dodenn� se sch�zej� v kostele.
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_02"); //Innosovi vyvolen� jsou v�ichni m�gov�. Innos jim poskytl tento dar, a tak mohou na zemi plnit jeho v�li.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_8_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_8_LOCATION_Condition;
	information	= DIA_NOV_8_LOCATION_Info;
	permanent	= TRUE;
	description = "Pov�z mi o kl�teru n�co v�c.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_LOCATION_15_00"); //�ekni mi o kl�teru n�co v�c.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_01"); //Jeho p�vod sah� hluboko do minulosti. Poch�z� z dob vl�dy Rhobara I.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_02"); //Pod kl�terem se rozkl�daj� katakomby. Vedou hluboko do hor.
	//AI_Output (self, other, "DIA_NOV_8_LOCATION_08_03"); //Aber zur untersten Ebene haben nur die h�chsten Geweihten Innos' Zutritt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_8_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_8_STANDARD_Condition;
	information	= DIA_NOV_8_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nov�ho?";
};
                       
func INT DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_STANDARD_15_00"); //Je n�co nov�ho?
		
	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_01"); //Dalo by se ��ct, �e ano. U� je to v�c ne� sto let, co byl n�jak� novic tak rychle p�ijat do kruhu ohn�.
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_02"); //Douf�m, �e se mi t�to cti tak� jednou dostane. Budu na tom tvrd� pracovat.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_03"); //Ned�vno do Khorinidu p�ijeli paladinov�. Jeden z nich je tady v kl�te�e, aby se tu modlil k Innosovi.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_08_04"); //Po��d tomu nemohu uv��it. Jeden z n�s zradil kl�ter a ukradl Innosovo oko.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_05"); //Na��m �kolem bylo vybudovat soudr�nou spole�nost, ale byli jsme p��li� slab�. To je jedin� d�vod, pro� se mohlo Beliarovi poda�it p�et�hnout jednoho z n�s na svou stranu.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_06"); //Innos bu� pochv�len. Poda�ilo se n�m Oko dostat od nep��tele zp�t.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_07"); //Tv� odvaha by mohla b�t p��kladem mnoha zoufal�m du��m, a pomoci jim tak p�e�kat tyto temn� �asy.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_08"); //Zaslechl jsem n�co o drac�ch a arm�d� zla. Innos n�s opatruj!
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_09"); //Nejvy��� rada m� na situaci na�ich paladin� zvl�tn� z�jem. U� n�jakou dobu jsme z Hornick�ho �dol� nedostali ��dn� zpr�vy.
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_10"); //Ne. A jsem za to na�emu P�nu vd��n�. S Innosov�m okem budeme moci ty draky porazit!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_11"); //Ano. Dos�hli jsme v�t�zstv� nad draky! Innos n�m uk�zal, �e nikdy nesm�me ztr�cet nad�ji.
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_12"); //V sou�asnosti se mus�me pot�kat se s�lou temnoty a bude t�eba za�ehnout je�t� mnoho oh��, abychom ji sprovodili ze sv�ta.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_8 (var c_NPC slf)
{
	DIA_NOV_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc					= Hlp_GetInstanceID(slf);
};
