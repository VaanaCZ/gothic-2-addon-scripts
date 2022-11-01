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
	description = "Potâebuju pomoci zamést pokoje noviců.";
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
	AI_Output (other, self, "DIA_NOV_8_Fegen_15_00"); //Potâebuju pomoct zamést pokoje noviců.
	
	if (Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self))
	{	
		if (Feger3_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_01"); //No nazdar. Právę jsi pâišel a hned ze sebe necháš dęlat uklízečku?
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_02"); //Uklidni se, se mnou to bylo to samé, když jsem sem poprvé pâišel. A proto se ti chystám pomoct. Asi by se nám pęknę vysmáli, kdybychom to nezvládli.
			
			NOV_Helfer = (NOV_Helfer +1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Už jsem narazil na novice, který mi s úklidem komnat pomůže.");
		}
		else //if (Feger3_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_03"); //Bratâe, jsem obeznámen se situací, do které ses dostal. A už jsem ti âekl, že ti pomohu. A to právę dęlám.
		};
	};
	//-------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------
	
	if ((Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self)) == FALSE )
	{	
		AI_Output (self, other, "DIA_NOV_8_Fegen_08_04"); //Hele, rád bych, ale fakt nemám čas.
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
	description = "Co takhle jemŕoučká skopová klobáska?";
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
	AI_Output (other, self, "DIA_NOV_8_Wurst_15_00"); //Co takhle jemŕoučká skopová klobáska?
	AI_Output (self, other, "DIA_NOV_8_Wurst_08_01"); //Tak tomu se nedá âíct ne. Díky, chlape, pâesnę to jsem potâeboval.
	
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
	description = "Co musím udęlat, abych se stal mágem?";
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
	AI_Output (other, self, "DIA_NOV_8_JOIN_15_00"); //Co musím udęlat, abych se stal mágem?
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_01"); //Innosovým vyvoleným se můžeš stát pouze v pâípadę, že k tomu dá svolení nejvyšší rada.
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_02"); //Jako novicové máme zakázáno studovat runovou magii - a staré posvátné spisy můžeme pročítat jen se svolením mágů.
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
	description = "Kdo vede tenhle klášter?";
};                       

FUNC INT DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_PEOPLE_15_00"); //Kdo vede tenhle klášter?
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_01"); //Nejvyšší rada, kterou tvoâí tâi nejmocnęjší mágové. Každodennę se scházejí v kostele.
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_02"); //Innosovi vyvolení jsou všichni mágové. Innos jim poskytl tento dar, a tak mohou na zemi plnit jeho vůli.
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
	description = "Povęz mi o klášteru nęco víc.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_LOCATION_15_00"); //Âekni mi o klášteru nęco víc.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_01"); //Jeho původ sahá hluboko do minulosti. Pochází z dob vlády Rhobara I.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_02"); //Pod klášterem se rozkládají katakomby. Vedou hluboko do hor.
	//AI_Output (self, other, "DIA_NOV_8_LOCATION_08_03"); //Aber zur untersten Ebene haben nur die höchsten Geweihten Innos' Zutritt.
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
	description = "Co je nového?";
};
                       
func INT DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_STANDARD_15_00"); //Je nęco nového?
		
	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_01"); //Dalo by se âíct, že ano. Už je to víc než sto let, co byl nęjaký novic tak rychle pâijat do kruhu ohnę.
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_02"); //Doufám, že se mi této cti také jednou dostane. Budu na tom tvrdę pracovat.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_03"); //Nedávno do Khorinidu pâijeli paladinové. Jeden z nich je tady v klášteâe, aby se tu modlil k Innosovi.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_08_04"); //Poâád tomu nemohu uvęâit. Jeden z nás zradil klášter a ukradl Innosovo oko.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_05"); //Naším úkolem bylo vybudovat soudržnou společnost, ale byli jsme pâíliš slabí. To je jediný důvod, proč se mohlo Beliarovi podaâit pâetáhnout jednoho z nás na svou stranu.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_06"); //Innos buë pochválen. Podaâilo se nám Oko dostat od nepâítele zpęt.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_07"); //Tvá odvaha by mohla být pâíkladem mnoha zoufalým duším, a pomoci jim tak pâečkat tyto temné časy.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_08"); //Zaslechl jsem nęco o dracích a armádę zla. Innos nás opatruj!
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_09"); //Nejvyšší rada má na situaci našich paladinů zvláštní zájem. Už nęjakou dobu jsme z Hornického údolí nedostali žádné zprávy.
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_10"); //Ne. A jsem za to našemu Pánu vdęčný. S Innosovým okem budeme moci ty draky porazit!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_11"); //Ano. Dosáhli jsme vítęzství nad draky! Innos nám ukázal, že nikdy nesmíme ztrácet nadęji.
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_12"); //V současnosti se musíme potýkat se sílou temnoty a bude tâeba zažehnout ještę mnoho ohŕů, abychom ji sprovodili ze svęta.
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
