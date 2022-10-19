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
	AI_Output (self ,other,"DIA_Moe_Hallo_01_00"); //Hej, nie znam ciê... Czego tutaj szukasz? Mo¿e knajpy?
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Nie, nie idê do knajpy... (KONIEC)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Wiêc to tutaj zbiera siê ca³e towarzystwo...",DIA_Moe_Hallo_Witz);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Tak, masz coœ przeciwko?",DIA_Moe_Hallo_Reizen);
};
FUNC VOID DIA_Moe_Hallo_Gehen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Gehen_15_00"); //Nie, nie szukam knajpy...
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_01"); //Tak, te¿ bym tak powiedzia³. Ale to nie ma znaczenia - i dlatego mo¿emy od razu przejœæ do interesów.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_02"); //Poniewa¿ jesteœ tu nowy, mam dla ciebie propozycjê. Zap³acisz mi 50 sztuk z³ota, a ja pozwolê ci wejœæ.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_03"); //Tyle kosztuje wejœcie do knajpy.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Dowiedzmy siê, co na ten temat s¹dzi stra¿...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet z³amanego grosza!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"W porz¹dku, zap³acê.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice    (DIA_Moe_Hallo,"Ale ja nie chcê wejœæ do knajpy!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Kneipe()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Kneipe_15_00"); //Ale ja nie chcê wejœæ do knajpy!
	AI_Output (self ,other,"DIA_Moe_Hallo_Kneipe_01_01"); //Taaak, prêdzej czy póŸniej ka¿dy chce wejœæ do knajpy. Wiêc równie dobrze mo¿esz mi zap³aciæ ju¿ teraz - i potem bêdziesz mia³ spokój.
};
FUNC VOID  DIA_Moe_Hallo_Witz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Witz_15_00"); //Ach, wiêc to tutaj zbiera siê ca³e towarzystwo. £atwo pomyliæ to miejsce z pa³acem gubernatora...
	AI_Output (self ,other,"DIA_Moe_Hallo_Witz_01_01"); //Hej, daruj sobie te kiepskie dowcipy, jeœli nie chcesz zbieraæ zêbów z ulicy.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Widzê, ¿e nie obêdzie siê bez bijatyki...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Za ma³o masz problemów?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Uspokój siê, chcê tylko wypiæ piwo.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice    (DIA_Moe_Hallo,"Ale ja nie chcê wejœæ do knajpy!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Reizen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Reizen_15_00"); //Tak, masz coœ przeciwko?
	AI_Output (self ,other,"DIA_Moe_Hallo_Reizen_01_01"); //Nie masz tu czego szukaæ, kurduplu.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Widzê, ¿e nie obêdzie siê bez bijatyki...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Za ma³o masz problemów?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Uspokój siê, chcê tylko wypiæ piwo.",DIA_Moe_Hallo_Ruhig);
};
FUNC VOID DIA_Moe_Hallo_Miliz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Miliz_15_00"); //Dowiedzmy siê, co na ten temat s¹dzi stra¿...
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_01"); //Na twoim miejscu nie liczy³bym na stra¿. Stra¿nicy tu nie przychodz¹.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_02"); //Jesteœmy w dzielnicy portowej, cwaniaczku. Baliby siê tutaj z kimkolwiek zadrzeæ.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_03"); //Stra¿nicy mog¹ co najwy¿ej chodziæ do 'Czerwonej Latarni'. A zatem, jak sam widzisz, to sprawa tylko miêdzy nami.
};
FUNC VOID DIA_Moe_Hallo_Pruegel()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Pruegel_15_00"); //Rozumiem. Widzê, ¿e nie obejdzie siê bez bijatyki.
	AI_Output (self ,other,"DIA_Moe_Hallo_Pruegel_01_01"); //Proszê bardzo, spróbuj. Poka¿, co potrafisz!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Aerger()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Aerger_15_00"); //Za ma³o masz problemów?
	AI_Output (self ,other,"DIA_Moe_Hallo_Aerger_01_01"); //Jasne, problemy to moje drugie imiê. Broñ siê, kurduplu!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Ruhig()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Ruhig_15_00"); //Uspokój siê, chcê tylko wypiæ piwo.
	AI_Output (self ,other,"DIA_Moe_Hallo_Ruhig_01_01"); //Dobrze, ale ¿eby wejœæ do œrodka, musisz mi zap³aciæ 50 sztuk z³ota.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet z³amanego grosza!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"W porz¹dku, zap³acê.",DIA_Moe_Hallo_Zahlen);
	
};
FUNC VOID DIA_Moe_Hallo_Zahlen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_00"); //W porz¹dku, zap³acê.
	
	if B_GiveInvItems (other, self, ItMi_Gold,50)
	{
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_01"); //Wspaniale. A skoro ju¿ posz³o nam tak ³atwo, mo¿esz mi teraz oddaæ resztê swoich pieniêdzy.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet z³amanego grosza!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Proszê, to wszystko, co mam.",DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems (hero, ItMi_Gold) > 9)
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_02"); //...ale nie mam przy sobie tylu pieniêdzy.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_03"); //To nie ma znaczenia. Po prostu daj mi wszystko, co masz.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet z³amanego grosza!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Proszê, to wszystko, co mam.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_04"); //...ale nie mam nawet 10 sztuk z³ota.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_05"); //Ale trafi³em.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_06"); //No dobrze ju¿, dobrze, mo¿esz wejœæ.
		
		AI_StopProcessInfos (self);
	};

};
FUNC VOID DIA_Moe_Hallo_Vergisses()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Vergisses_15_00"); //Zapomnij o tym, nie dostaniesz nawet z³amanego grosza!
	AI_Output (self ,other,"DIA_Moe_Hallo_Vergisses_01_01"); //Wiêc zabiorê wszystko, co masz - ale najpierw spuszczê ci porz¹dne lanie.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Alles()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Alles_15_00"); //Proszê, to wszystko, co mam.
	
	B_GiveInvItems (other, self, ItMi_Gold, Npc_HasItems (other,ItMi_Gold));
	
	AI_Output (self ,other,"DIA_Moe_Hallo_Alles_01_01"); //Dobrze, to wystarczy. Chodz¹ca pob³a¿liwoœæ - oto ca³y ja.
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
	description = "Wiesz, co dzieje siê w porcie, prawda?";
};                       

FUNC INT DIA_Moe_Harbor_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_Moe_Harbor_Info()
{	
	AI_Output (other,self ,"DIA_Moe_Harbor_15_00"); //Wiesz, co dzieje siê w porcie, prawda?
	AI_Output (self ,other,"DIA_Moe_Harbor_01_01"); //Pewnie. A dlaczego pytasz?
	
	Info_ClearChoices (DIA_Moe_Harbor);
	Info_AddChoice		(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice		(DIA_Moe_Harbor,"Du¿o tu macie statków?",DIA_Moe_Harbor_Ship);
	Info_AddChoice		(DIA_Moe_Harbor,"Czemu nie widzê tu ¿adnej stra¿y?",DIA_Moe_Harbor_Militia);
	Info_AddChoice 		(DIA_Moe_Harbor,"S³ysza³eœ ostatnio jakieœ plotki?",DIA_Moe_Harbor_Rumors);
};

FUNC VOID DIA_Moe_Harbor_Back ()
{
	Info_ClearChoices (DIA_Moe_Harbor);
};

FUNC VOID DIA_Moe_Harbor_Ship ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Ship_15_00"); //Du¿o tu macie statków?
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_01"); //Jedyny statek w tym mieœcie nale¿y do paladynów.
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_02"); //Jest zacumowany na po³udniowym zachodzie.
	
};

FUNC VOID DIA_Moe_Harbor_Militia ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Militia_15_00"); //Czemu nie widzê tu ¿adnej stra¿y?
	AI_Output (self ,other,"DIA_Moe_Harbor_Militia_01_01"); //Stra¿ tutaj nie przychodzi. Sami za³atwiamy nasze spory.
};

FUNC VOID DIA_Moe_Harbor_Rumors ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_00"); //S³ysza³eœ ostatnio jakieœ plotki?
	
	if (Kapitel == 1)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_01"); //W tych okolicach nie lubimy, kiedy ktoœ zadaje zbyt du¿o pytañ. Szczególnie jeœli jest to ktoœ obcy.
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_02"); //¯adnych. A czego siê spodziewa³eœ? To spokojne miejsce.
		}
		else if (hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_03"); //Nie jest dobrze. Czasy s¹ ciê¿kie, a my z trudem wi¹¿emy koniec z koñcem.
			AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_04"); //Przestañ siê ze mnie nabijaæ.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_05"); //Jak mog³eœ pomyœleæ coœ takiego? Zrani³eœ moje uczucia.
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_06"); //Jest nieweso³o. Od jakiegoœ czasu Lord Andre ci¹gle wsadza nos w nie swoje sprawy.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_07"); //Taki elegancik nigdy nie zrozumie, co siê tutaj dzieje.
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
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_08"); //Nie mamy z tym nic wspólnego.
				AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_09"); //To znaczy z czym?
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_10"); //Z tym zamordowanym paladynem. Powinieneœ zainteresowaæ siê najemnikami, zamiast marnowaæ tutaj swój czas.
			}
			else
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_11"); //Wiem, ¿e nie mia³eœ z tym nic wspólnego, ale to morderstwo naprawdê wzbudzi³o niepokój porz¹dnych obywateli.
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_12"); //Jeœli zechcesz przyj¹æ przyjacielsk¹ radê, najlepiej bêdzie, jeœli znikniesz z miasta. Przynajmniej na jakiœ czas.
			};	
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_13"); //Odk¹d zosta³o udowodnione, ¿e najemnicy nie mieli nic wspólnego ze œmierci¹ tego paladyna, stra¿ boi siê tu przychodziæ.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_14"); //Pewnie obawiaj¹ siê tych paru mieszkaj¹cych tutaj pijaków, he, he. I dobrze.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_15"); //Nic siê tu nie dzieje.
	}
	else //Kapitel 5
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_16"); //Ci nadêci paladyni opuszczaj¹ nasz port. Najwy¿szy czas.
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
	AI_Output (self, other, "DIA_Moe_LEHMARGELDEINTREIBEN_01_00"); //Hej, ty! Pozdrowienia od Lehmara.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};







