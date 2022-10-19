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
	description = "Potøebuju pomoci zamést pokoje novicù.";
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
	AI_Output (other, self, "DIA_NOV_8_Fegen_15_00"); //Potøebuju pomoct zamést pokoje novicù.
	
	if (Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self))
	{	
		if (Feger3_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_01"); //No nazdar. Právì jsi pøišel a hned ze sebe necháš dìlat uklízeèku?
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_02"); //Uklidni se, se mnou to bylo to samé, když jsem sem poprvé pøišel. A proto se ti chystám pomoct. Asi by se nám pìknì vysmáli, kdybychom to nezvládli.
			
			NOV_Helfer = (NOV_Helfer +1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Už jsem narazil na novice, který mi s úklidem komnat pomùže.");
		}
		else //if (Feger3_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_03"); //Bratøe, jsem obeznámen se situací, do které ses dostal. A už jsem ti øekl, že ti pomohu. A to právì dìlám.
		};
	};
	//-------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------
	
	if ((Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self)) == FALSE )
	{	
		AI_Output (self, other, "DIA_NOV_8_Fegen_08_04"); //Hele, rád bych, ale fakt nemám èas.
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
	description = "Co takhle jemòouèká skopová klobáska?";
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
	AI_Output (other, self, "DIA_NOV_8_Wurst_15_00"); //Co takhle jemòouèká skopová klobáska?
	AI_Output (self, other, "DIA_NOV_8_Wurst_08_01"); //Tak tomu se nedá øíct ne. Díky, chlape, pøesnì to jsem potøeboval.
	
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
	description = "Co musím udìlat, abych se stal mágem?";
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
	AI_Output (other, self, "DIA_NOV_8_JOIN_15_00"); //Co musím udìlat, abych se stal mágem?
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_01"); //Innosovým vyvoleným se mùžeš stát pouze v pøípadì, že k tomu dá svolení nejvyšší rada.
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_02"); //Jako novicové máme zakázáno studovat runovou magii - a staré posvátné spisy mùžeme proèítat jen se svolením mágù.
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
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_01"); //Nejvyšší rada, kterou tvoøí tøi nejmocnìjší mágové. Každodennì se scházejí v kostele.
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_02"); //Innosovi vyvolení jsou všichni mágové. Innos jim poskytl tento dar, a tak mohou na zemi plnit jeho vùli.
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
	description = "Povìz mi o klášteru nìco víc.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_LOCATION_15_00"); //Øekni mi o klášteru nìco víc.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_01"); //Jeho pùvod sahá hluboko do minulosti. Pochází z dob vlády Rhobara I.
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
	AI_Output (other, self, "DIA_NOV_8_STANDARD_15_00"); //Je nìco nového?
		
	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_01"); //Dalo by se øíct, že ano. Už je to víc než sto let, co byl nìjaký novic tak rychle pøijat do kruhu ohnì.
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_02"); //Doufám, že se mi této cti také jednou dostane. Budu na tom tvrdì pracovat.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_03"); //Nedávno do Khorinidu pøijeli paladinové. Jeden z nich je tady v klášteøe, aby se tu modlil k Innosovi.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_08_04"); //Poøád tomu nemohu uvìøit. Jeden z nás zradil klášter a ukradl Innosovo oko.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_05"); //Naším úkolem bylo vybudovat soudržnou spoleènost, ale byli jsme pøíliš slabí. To je jediný dùvod, proè se mohlo Beliarovi podaøit pøetáhnout jednoho z nás na svou stranu.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_06"); //Innos buï pochválen. Podaøilo se nám Oko dostat od nepøítele zpìt.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_07"); //Tvá odvaha by mohla být pøíkladem mnoha zoufalým duším, a pomoci jim tak pøeèkat tyto temné èasy.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_08"); //Zaslechl jsem nìco o dracích a armádì zla. Innos nás opatruj!
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_09"); //Nejvyšší rada má na situaci našich paladinù zvláštní zájem. Už nìjakou dobu jsme z Hornického údolí nedostali žádné zprávy.
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_10"); //Ne. A jsem za to našemu Pánu vdìèný. S Innosovým okem budeme moci ty draky porazit!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_11"); //Ano. Dosáhli jsme vítìzství nad draky! Innos nám ukázal, že nikdy nesmíme ztrácet nadìji.
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_12"); //V souèasnosti se musíme potýkat se sílou temnoty a bude tøeba zažehnout ještì mnoho ohòù, abychom ji sprovodili ze svìta.
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
