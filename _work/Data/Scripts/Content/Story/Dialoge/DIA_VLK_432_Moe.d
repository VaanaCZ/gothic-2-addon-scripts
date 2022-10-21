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
	AI_Output (self ,other,"DIA_Moe_Hallo_01_00"); //Hej, nie znam ci�... Czego tutaj szukasz? Mo�e knajpy?
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Nie, nie id� do knajpy... (KONIEC)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Wi�c to tutaj zbiera si� ca�e towarzystwo...",DIA_Moe_Hallo_Witz);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Tak, masz co� przeciwko?",DIA_Moe_Hallo_Reizen);
};
FUNC VOID DIA_Moe_Hallo_Gehen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Gehen_15_00"); //Nie, nie szukam knajpy...
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_01"); //Tak, te� bym tak powiedzia�. Ale to nie ma znaczenia - i dlatego mo�emy od razu przej�� do interes�w.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_02"); //Poniewa� jeste� tu nowy, mam dla ciebie propozycj�. Zap�acisz mi 50 sztuk z�ota, a ja pozwol� ci wej��.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_03"); //Tyle kosztuje wej�cie do knajpy.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Dowiedzmy si�, co na ten temat s�dzi stra�...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet z�amanego grosza!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"W porz�dku, zap�ac�.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice    (DIA_Moe_Hallo,"Ale ja nie chc� wej�� do knajpy!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Kneipe()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Kneipe_15_00"); //Ale ja nie chc� wej�� do knajpy!
	AI_Output (self ,other,"DIA_Moe_Hallo_Kneipe_01_01"); //Taaak, pr�dzej czy p�niej ka�dy chce wej�� do knajpy. Wi�c r�wnie dobrze mo�esz mi zap�aci� ju� teraz - i potem b�dziesz mia� spok�j.
};
FUNC VOID  DIA_Moe_Hallo_Witz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Witz_15_00"); //Ach, wi�c to tutaj zbiera si� ca�e towarzystwo. �atwo pomyli� to miejsce z pa�acem gubernatora...
	AI_Output (self ,other,"DIA_Moe_Hallo_Witz_01_01"); //Hej, daruj sobie te kiepskie dowcipy, je�li nie chcesz zbiera� z�b�w z ulicy.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Widz�, �e nie ob�dzie si� bez bijatyki...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Za ma�o masz problem�w?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Uspok�j si�, chc� tylko wypi� piwo.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice    (DIA_Moe_Hallo,"Ale ja nie chc� wej�� do knajpy!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Reizen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Reizen_15_00"); //Tak, masz co� przeciwko?
	AI_Output (self ,other,"DIA_Moe_Hallo_Reizen_01_01"); //Nie masz tu czego szuka�, kurduplu.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Widz�, �e nie ob�dzie si� bez bijatyki...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Za ma�o masz problem�w?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Uspok�j si�, chc� tylko wypi� piwo.",DIA_Moe_Hallo_Ruhig);
};
FUNC VOID DIA_Moe_Hallo_Miliz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Miliz_15_00"); //Dowiedzmy si�, co na ten temat s�dzi stra�...
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_01"); //Na twoim miejscu nie liczy�bym na stra�. Stra�nicy tu nie przychodz�.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_02"); //Jeste�my w dzielnicy portowej, cwaniaczku. Baliby si� tutaj z kimkolwiek zadrze�.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_03"); //Stra�nicy mog� co najwy�ej chodzi� do 'Czerwonej Latarni'. A zatem, jak sam widzisz, to sprawa tylko mi�dzy nami.
};
FUNC VOID DIA_Moe_Hallo_Pruegel()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Pruegel_15_00"); //Rozumiem. Widz�, �e nie obejdzie si� bez bijatyki.
	AI_Output (self ,other,"DIA_Moe_Hallo_Pruegel_01_01"); //Prosz� bardzo, spr�buj. Poka�, co potrafisz!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Aerger()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Aerger_15_00"); //Za ma�o masz problem�w?
	AI_Output (self ,other,"DIA_Moe_Hallo_Aerger_01_01"); //Jasne, problemy to moje drugie imi�. Bro� si�, kurduplu!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Ruhig()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Ruhig_15_00"); //Uspok�j si�, chc� tylko wypi� piwo.
	AI_Output (self ,other,"DIA_Moe_Hallo_Ruhig_01_01"); //Dobrze, ale �eby wej�� do �rodka, musisz mi zap�aci� 50 sztuk z�ota.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet z�amanego grosza!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"W porz�dku, zap�ac�.",DIA_Moe_Hallo_Zahlen);
	
};
FUNC VOID DIA_Moe_Hallo_Zahlen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_00"); //W porz�dku, zap�ac�.
	
	if B_GiveInvItems (other, self, ItMi_Gold,50)
	{
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_01"); //Wspaniale. A skoro ju� posz�o nam tak �atwo, mo�esz mi teraz odda� reszt� swoich pieni�dzy.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet z�amanego grosza!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Prosz�, to wszystko, co mam.",DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems (hero, ItMi_Gold) > 9)
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_02"); //...ale nie mam przy sobie tylu pieni�dzy.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_03"); //To nie ma znaczenia. Po prostu daj mi wszystko, co masz.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Zapomnij o tym, nie dostaniesz nawet z�amanego grosza!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Prosz�, to wszystko, co mam.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_04"); //...ale nie mam nawet 10 sztuk z�ota.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_05"); //Ale trafi�em.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_06"); //No dobrze ju�, dobrze, mo�esz wej��.
		
		AI_StopProcessInfos (self);
	};

};
FUNC VOID DIA_Moe_Hallo_Vergisses()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Vergisses_15_00"); //Zapomnij o tym, nie dostaniesz nawet z�amanego grosza!
	AI_Output (self ,other,"DIA_Moe_Hallo_Vergisses_01_01"); //Wi�c zabior� wszystko, co masz - ale najpierw spuszcz� ci porz�dne lanie.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Alles()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Alles_15_00"); //Prosz�, to wszystko, co mam.
	
	B_GiveInvItems (other, self, ItMi_Gold, Npc_HasItems (other,ItMi_Gold));
	
	AI_Output (self ,other,"DIA_Moe_Hallo_Alles_01_01"); //Dobrze, to wystarczy. Chodz�ca pob�a�liwo�� - oto ca�y ja.
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
	description = "Wiesz, co dzieje si� w porcie, prawda?";
};                       

FUNC INT DIA_Moe_Harbor_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_Moe_Harbor_Info()
{	
	AI_Output (other,self ,"DIA_Moe_Harbor_15_00"); //Wiesz, co dzieje si� w porcie, prawda?
	AI_Output (self ,other,"DIA_Moe_Harbor_01_01"); //Pewnie. A dlaczego pytasz?
	
	Info_ClearChoices (DIA_Moe_Harbor);
	Info_AddChoice		(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice		(DIA_Moe_Harbor,"Du�o tu macie statk�w?",DIA_Moe_Harbor_Ship);
	Info_AddChoice		(DIA_Moe_Harbor,"Czemu nie widz� tu �adnej stra�y?",DIA_Moe_Harbor_Militia);
	Info_AddChoice 		(DIA_Moe_Harbor,"S�ysza�e� ostatnio jakie� plotki?",DIA_Moe_Harbor_Rumors);
};

FUNC VOID DIA_Moe_Harbor_Back ()
{
	Info_ClearChoices (DIA_Moe_Harbor);
};

FUNC VOID DIA_Moe_Harbor_Ship ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Ship_15_00"); //Du�o tu macie statk�w?
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_01"); //Jedyny statek w tym mie�cie nale�y do paladyn�w.
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_02"); //Jest zacumowany na po�udniowym zachodzie.
	
};

FUNC VOID DIA_Moe_Harbor_Militia ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Militia_15_00"); //Czemu nie widz� tu �adnej stra�y?
	AI_Output (self ,other,"DIA_Moe_Harbor_Militia_01_01"); //Stra� tutaj nie przychodzi. Sami za�atwiamy nasze spory.
};

FUNC VOID DIA_Moe_Harbor_Rumors ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_00"); //S�ysza�e� ostatnio jakie� plotki?
	
	if (Kapitel == 1)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_01"); //W tych okolicach nie lubimy, kiedy kto� zadaje zbyt du�o pyta�. Szczeg�lnie je�li jest to kto� obcy.
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_02"); //�adnych. A czego si� spodziewa�e�? To spokojne miejsce.
		}
		else if (hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_03"); //Nie jest dobrze. Czasy s� ci�kie, a my z trudem wi��emy koniec z ko�cem.
			AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_04"); //Przesta� si� ze mnie nabija�.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_05"); //Jak mog�e� pomy�le� co� takiego? Zrani�e� moje uczucia.
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_06"); //Jest nieweso�o. Od jakiego� czasu Lord Andre ci�gle wsadza nos w nie swoje sprawy.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_07"); //Taki elegancik nigdy nie zrozumie, co si� tutaj dzieje.
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
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_08"); //Nie mamy z tym nic wsp�lnego.
				AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_09"); //To znaczy z czym?
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_10"); //Z tym zamordowanym paladynem. Powiniene� zainteresowa� si� najemnikami, zamiast marnowa� tutaj sw�j czas.
			}
			else
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_11"); //Wiem, �e nie mia�e� z tym nic wsp�lnego, ale to morderstwo naprawd� wzbudzi�o niepok�j porz�dnych obywateli.
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_12"); //Je�li zechcesz przyj�� przyjacielsk� rad�, najlepiej b�dzie, je�li znikniesz z miasta. Przynajmniej na jaki� czas.
			};	
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_13"); //Odk�d zosta�o udowodnione, �e najemnicy nie mieli nic wsp�lnego ze �mierci� tego paladyna, stra� boi si� tu przychodzi�.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_14"); //Pewnie obawiaj� si� tych paru mieszkaj�cych tutaj pijak�w, he, he. I dobrze.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_15"); //Nic si� tu nie dzieje.
	}
	else //Kapitel 5
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_16"); //Ci nad�ci paladyni opuszczaj� nasz port. Najwy�szy czas.
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







