<template>
  <el-form ref="ruleFormRef" :model="ruleForm" :rules="rules" label-width="120px" class="demo-ruleForm" :size="formSize" status-icon>
    <el-form-item label="活动名称" prop="name">
      <el-input v-model="ruleForm.name" />
    </el-form-item>
    <el-form-item label="活动范围" prop="region">
      <el-select v-model="ruleForm.region" placeholder="Activity zone">
        <el-option label="区县" value="1" />
        <el-option label="市级" value="2" />
      </el-select>
    </el-form-item>
    <el-form-item label="活动次数" prop="count">
      <el-select-v2 v-model="ruleForm.count" placeholder="Activity count" :options="options" />
    </el-form-item>
    <el-form-item label="活动时间" required>
      <el-col :span="11">
        <el-form-item prop="date1">
          <el-date-picker v-model="ruleForm.date1" type="date" label="Pick a date" placeholder="Pick a date" style="width: 100%" />
        </el-form-item>
      </el-col>
      <el-col class="text-center" :span="2">
        <span class="text-gray-500">-</span>
      </el-col>
      <el-col :span="11">
        <el-form-item prop="date2">
          <el-time-picker v-model="ruleForm.date2" label="Pick a time" placeholder="Pick a time" style="width: 100%" />
        </el-form-item>
      </el-col>
    </el-form-item>
    <el-form-item label="是否由我组织" prop="delivery">
      <el-switch v-model="ruleForm.delivery" />
    </el-form-item>
    <el-form-item label="活动类型" prop="type">
      <el-checkbox-group v-model="ruleForm.type">
        <el-checkbox label="社区活动" name="1" />
        <el-checkbox label="学校活动" name="2" />
        <el-checkbox label="党校活动" name="3" />
        <el-checkbox label="企业活动" name="4" />
      </el-checkbox-group>
    </el-form-item>
    <el-form-item label="来源" prop="resource">
      <el-radio-group v-model="ruleForm.resource">
        <el-radio label="你" />
        <el-radio label="我" />
      </el-radio-group>
    </el-form-item>
    <el-form-item label="活动描述" prop="desc">
      <el-input v-model="ruleForm.desc" type="textarea" />
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submitForm(ruleFormRef)">确 认</el-button>
      <el-button @click="resetForm(ruleFormRef)">取 消</el-button>
    </el-form-item>
  </el-form>

  <el-button @click="chageSize">改变大小</el-button>
</template>

<script lang="ts" setup>
import type { FormInstance, FormRules } from 'element-plus';
import { reactive, ref } from 'vue';
let size = ref('samll');
let sType = ref('primary');
type FormSizeType = 'default' | 'small' | 'min';
const formSize: FormSizeType = size as any;
const ruleFormRef = ref<FormInstance>();
const ruleForm = reactive({
  name: 'Hello',
  region: '',
  count: '',
  date1: '',
  date2: '',
  delivery: false,
  type: [],
  resource: '',
  desc: ''
});

const rules = reactive<FormRules>({
  name: [
    { required: true, message: '请输入活动名称', trigger: 'blur' },
    { min: 3, max: 5, message: 'Length should be 3 to 5', trigger: 'blur' }
  ],
  region: [
    {
      required: true,
      message: 'Please select Activity zone',
      trigger: 'change'
    }
  ],
  count: [
    {
      required: true,
      message: 'Please select Activity count',
      trigger: 'change'
    }
  ],
  date1: [
    {
      type: 'date',
      required: true,
      message: 'Please pick a date',
      trigger: 'change'
    }
  ],
  date2: [
    {
      type: 'date',
      required: true,
      message: 'Please pick a time',
      trigger: 'change'
    }
  ],
  type: [
    {
      type: 'array',
      required: true,
      message: 'Please select at least one activity type',
      trigger: 'change'
    }
  ],
  resource: [
    {
      required: true,
      message: 'Please select activity resource',
      trigger: 'change'
    }
  ],
  desc: [{ required: true, message: 'Please input activity form', trigger: 'blur' }]
});

const submitForm = async (formEl: FormInstance | undefined) => {
  if (!formEl) return;
  await formEl.validate((valid, fields) => {
    if (valid) {
      console.log('submit!');
    } else {
      console.log('error submit!', fields);
    }
  });
};

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return;
  formEl.resetFields();
};

const options = Array.from({ length: 10000 }).map((_, idx) => ({
  value: `${idx + 1}`,
  label: `${idx + 1}`
}));
console.log(888, Array.from({ length: 10000 }));

console.log(8989, options);
const chageSize = () => {
  size.value = 'mini';
  console.log(777, formSize, size.value);
};

// watch(size);
</script>
