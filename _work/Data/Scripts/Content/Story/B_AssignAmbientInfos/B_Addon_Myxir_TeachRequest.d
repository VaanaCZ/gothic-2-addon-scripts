///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Nauè mì tomu jazyku.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Zaèneme od nejjednoduššího. Nejdøív tì tedy nauèím jazyku rolníkù.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Základním pravidlem písemných záznamù rolníkù je, že se zabývají svìtskými záležitostmi, jako je práce, láska nebo získávání potravy.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //Býval to bìžný jazyk ve mìstech. Pokud jej znáš, dokážeš pochopit vìtšinu zdejších textù.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Jazykem rolníkù už vládneš, ale jazyk váleèníkù je o nìco obtížnìjší.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Texty v tomto jazyce se vìtšinou týkají zbraní a válèení. I ty by ses z jejich záznamù mohl lecèemus pøiuèit.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //Vytøíbený jazyk knìží je skuteènì obtížné pochopit, ale rád ti s tím pomohu.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Je to jazyk posvátných textù, které pojednávají o historii a o magii stvoøitelù.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Každý z tìchto textù je skuteèným pokladem, když víš, co znamená.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //Víc už tì nauèit nemohu. Jazyk stavitelù jsi už plnì zvládl.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //Bìž si vyzkoušet své nové znalosti. Uvidíš, že jazyk stavitelù už ti nebude tak nepochopitelnou záhadou.
};



