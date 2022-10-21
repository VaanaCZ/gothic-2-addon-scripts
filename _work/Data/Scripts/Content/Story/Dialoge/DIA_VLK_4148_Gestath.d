///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gestath_EXIT   (C_INFO)
{
	npc         = VLK_4148_Gestath;
	nr          = 999;
	condition   = DIA_Gestath_EXIT_Condition;
	information = DIA_Gestath_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Gestath_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gestath_EXIT_Info()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	if (Hlp_IsItem (heroArmor, ITAR_DJG_Crawler) == TRUE)
	{
		AI_Output			(self, other, "DIA_Gestath_EXIT_09_00"); //(úseènì) Pìkná zbroj!
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Gestath_HALLO		(C_INFO)
{
	npc		 = 	VLK_4148_Gestath;
	nr		 = 	3;
	condition	 = 	DIA_Gestath_HALLO_Condition;
	information	 = 	DIA_Gestath_HALLO_Info;

	description	 = 	"Jak to jde?";
};

func int DIA_Gestath_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Gestath_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_15_00"); //Jak se vede?
	AI_Output			(self, other, "DIA_Gestath_HALLO_09_01"); //(úseènì) Máš kuráž, že jsi sem pøišel. Nezabloudil jsi náhodou?
	Gestath_TeachAnimalTrophy = TRUE;
	Info_ClearChoices	(DIA_Gestath_HALLO);
	Info_AddChoice	(DIA_Gestath_HALLO, "Co je tady k vidìní?", DIA_Gestath_HALLO_waszusehen );
	Info_AddChoice	(DIA_Gestath_HALLO, "Co tady dìláš?", DIA_Gestath_HALLO_was );
};
func void DIA_Gestath_HALLO_plate ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_plate_15_00"); //Ta zbroj, co máš na sobì, je parádní.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_09_01"); //To teda jo, a taky tìžko k sehnání. Je udìlaná z krunýøù dùlních èervù - vyrobil mi ji jistý Vlk.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_09_02"); //Døív jsem býval v téhle kolonii vìznìm. Dal jsem mu pár krunýøù dùlních èervù a za pár dní už svou práci dokonèil. Ten chlap je skvìlý.

	Wolf_ProduceCrawlerArmor = TRUE;
	
	Info_AddChoice	(DIA_Gestath_HALLO, DIALOG_BACK, DIA_Gestath_HALLO_Back );
	Info_AddChoice	(DIA_Gestath_HALLO, "Kde je ten Vlk teï?", DIA_Gestath_HALLO_plate_woWolf );
};
func void DIA_Gestath_HALLO_plate_woWolf ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_plate_woWolf_15_00"); //Kde je ten Vlk teï?
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_woWolf_09_01"); //Už jsem ho nìjakou dobu nevidìl. Tenkrát byl žoldákem tady v kolonii.
	AI_Output			(self, other, "DIA_Gestath_HALLO_plate_woWolf_09_02"); //Poèítám, že se tu nìkde potuluje s ostatními.
};

func void DIA_Gestath_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_was_15_00"); //Co tady dìláš?
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_01"); //Chci si nìco vydìlat.
	AI_Output			(other, self, "DIA_Gestath_HALLO_was_15_02"); //Tady, uprostøed pustiny?
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_03"); //Jsem lovec. Specializuji se na to, co se loví jen tìžko.
	AI_Output			(self, other, "DIA_Gestath_HALLO_was_09_04"); //Ohniví ještìøi, dùlní èervi, draèí chòapavci - prostì všechno, co nikdo jiný neloví. To vždycky dobøe vynáší.
	
	Info_AddChoice	(DIA_Gestath_HALLO, "Ta zbroj, co máš na sobì, je parádní.", DIA_Gestath_HALLO_plate );
};

func void DIA_Gestath_HALLO_waszusehen ()
{
	AI_Output			(other, self, "DIA_Gestath_HALLO_waszusehen_15_00"); //Co je tady k vidìní?
	AI_Output			(self, other, "DIA_Gestath_HALLO_waszusehen_09_01"); //Hromada ještìrù, skøetù a bùhvíèeho ještì. A to jsem ještì nebyl moc daleko na pláni.
	AI_Output			(self, other, "DIA_Gestath_HALLO_waszusehen_09_02"); //A tobì bych to taky neradil. To, co tam žije, opravdu nevypadá moc pøátelsky.
};

func void DIA_Gestath_HALLO_Back ()
{
	Info_ClearChoices	(DIA_Gestath_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info Drachen
///////////////////////////////////////////////////////////////////////
instance DIA_Gestath_Drachen		(C_INFO)
{
	npc		 = 	VLK_4148_Gestath;
	nr		 = 	3;
	condition	 = 	DIA_Gestath_Drachen_Condition;
	information	 = 	DIA_Gestath_Drachen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dokážeš taky vyvrhnout draka?";
};
var int Gestath_DragonTrophy;

func int DIA_Gestath_Drachen_Condition ()
{
	if (Gestath_DragonTrophy == FALSE)
	&& (Gestath_TeachAnimalTrophy == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Gestath_Drachen_Info ()
{
	AI_Output			(other, self, "DIA_Gestath_Drachen_15_00"); //Dokážeš taky vyvrhnout draka?
	if (Kapitel < 4)
	{
		AI_Output			(self, other, "DIA_Gestath_Drachen_09_01"); //(usmìje se) Zeptej se mì pozdìji, až budeš na nìco takového pøipravený, jo?
	}
	else
	{	
		AI_Output			(self, other, "DIA_Gestath_Drachen_09_02"); //Jasnì, proè ne?
		Gestath_DragonTrophy = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Gestath_TEACHHUNTING		(C_INFO)
{
	npc		     = 	VLK_4148_Gestath;
	nr           =  12;
	condition	 = 	DIA_Gestath_TEACHHUNTING_Condition;
	information	 = 	DIA_Gestath_TEACHHUNTING_Info;
	permanent	 =  TRUE;
	description	 = 	"Vysvìtli mi, jak vyvrhnout zvíøata.";
};

func int DIA_Gestath_TEACHHUNTING_Condition ()
{
	if (Gestath_TeachAnimalTrophy == TRUE)
		{
				return TRUE;
		};
};

var int DIA_Gestath_TEACHHUNTING_OneTime;
func void DIA_Gestath_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Gestath_TEACHHUNTING_15_00"); //Vysvìtli mi, jak vyvrhnout zvíøata.
	if 	(
			(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
			||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
			||	(
				(Gestath_DragonTrophy == TRUE)
				&&	(
					(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
					||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
					)
				)
		)
			{
				if (DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
					{
						AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_01"); //Proè ne? Myslím, že už toho umím dost.
						DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
					}
				else
					{
						AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_02"); //Co bys rád vìdìl?
					};
	
				Info_AddChoice		(DIA_Gestath_TEACHHUNTING, DIALOG_BACK, DIA_Gestath_TEACHHUNTING_BACK);
			
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Ohnivý jazyk",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)),  DIA_Gestath_TEACHHUNTING_FireTongue);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Oddìlení èervích krunýøù",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  DIA_Gestath_TEACHHUNTING_CrawlerPlate	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Vyjmutí kusadel",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Gestath_TEACHHUNTING_Mandibles	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
				{ 
					Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Roh draèího chòapavce",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)),  DIA_Gestath_TEACHHUNTING_DrgSnapperHorn);
				};
				
				if (Gestath_DragonTrophy == TRUE)
				{	
					if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
					{ 
						Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Získání draèích šupin",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)),  DIA_Gestath_TEACHHUNTING_DragonScale);
					};
					if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
					{ 
						Info_AddChoice	(DIA_Gestath_TEACHHUNTING, B_BuildLearnString ("Získání draèí krve",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)),  DIA_Gestath_TEACHHUNTING_DragonBlood);
					};
				};			
			}
			else
			{
				AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_09_03"); //V téhle chvíli nevím, co bych tì ještì nauèil.
			};
};

func void DIA_Gestath_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_FireTongue))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_FireTongue_09_00"); //Ohnivé ještìrce lze vyøíznout jazyk jediným tahem nože, když jej pøitom druhou rukou opatrnì pøidržuješ.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_CrawlerPlate()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00"); //Èerví krunýøe musíš oddìlovat dostateènì silným nožem.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_Mandibles_09_00"); //Kusadla jsou v lebkách polních škùdcù a dùlních èervù vrostlá pomìrnì hluboko. Proto si s nimi musíš chvíli pohrát, než se ti podaøí je dostat ven.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DrgSnapperHorn ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DrgSnapperHorn))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00"); //Nejlepší místo, kde zaèít s vyjímáním rohu draèího chòapavce, je støed èela. Pøitom musíš používat dost masivní nùž.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonScale ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonScale))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DragonScale_09_00"); //Draèí šupiny lze vyjmout velmi tìžko, ale ve chvíli, kdy už si zaèneš myslet, že to nezvládneš, zèistajasna z draèího høbetu koneènì odpadnou.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonBlood ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_DragonBlood))
		{
			AI_Output			(self, other, "DIA_Gestath_TEACHHUNTING_DragonBlood_09_00"); //Chceš-li získat krev, zamìø se na drakovo bøicho. Najdi mìkké místo a pak je probodni ostrým nožem.
		};
	Info_ClearChoices	(DIA_Gestath_TEACHHUNTING);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gestath_PICKPOCKET (C_INFO)
{
	npc			= VLK_4148_Gestath;
	nr			= 900;
	condition	= DIA_Gestath_PICKPOCKET_Condition;
	information	= DIA_Gestath_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Gestath_PICKPOCKET_Condition()
{
	C_Beklauen (81, 350);
};
 
FUNC VOID DIA_Gestath_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gestath_PICKPOCKET);
	Info_AddChoice		(DIA_Gestath_PICKPOCKET, DIALOG_BACK 		,DIA_Gestath_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gestath_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gestath_PICKPOCKET_DoIt);
};

func void DIA_Gestath_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gestath_PICKPOCKET);
};
	
func void DIA_Gestath_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gestath_PICKPOCKET);
};








 








